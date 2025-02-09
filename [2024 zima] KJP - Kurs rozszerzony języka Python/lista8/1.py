import asyncio
import aiohttp
from datetime import datetime, UTC, timedelta
from collections import defaultdict
import matplotlib.pyplot as plt
import numpy as np

async def fetch_public_api(session):
    url = "https://stat.gov.pl/download/gfx/portalinformacyjny/pl/defaultstronaopisowa/4741/1/1/miesieczne_wskazniki_cen_towarow_i_uslug_konsumpcyjnych_od_1982_roku.csv"
    async with session.get(url) as response:
        data = await response.text(encoding="unicode-escape")
        data = data.split("\n")
        monthly_data = {}
        for line in data:
            line = line.split(";")
            if len(line)<6: continue
            if "Poprzedni mies" in line[2]:
                rok = int(line[3])
                miesiac = int(line[4])
                if line[5]=="": continue
                wartosc = float(line[5].replace(",", "."))-100
                if rok<2022 or rok==2022 and miesiac<11: continue
                monthly_data[str(rok)+"-"+("0"+str(miesiac) if miesiac<10 else str(miesiac))]=wartosc
        return sorted(monthly_data.items())

async def fetch_blockchain_api(session):
    url = f"https://api.blockchain.info/charts/market-price?timespan=2year&sampled=true&metadata=false&daysAverageString=1d&cors=true&format=json"
    async with session.get(url) as response:
        data = (await response.json())['values']
        monthly_data = defaultdict(list)
        for v in data:
            monthly_data[datetime.fromtimestamp(v["x"], UTC).strftime("%Y-%m")].append(v["y"])
        return sorted({k: sum(month)/len(month) for k, month in monthly_data.items()}.items())

def chebyshev_interpolation(x_vals, y_vals, x, n):
    coefficients = np.polynomial.chebyshev.chebfit(x_vals, y_vals, n)
    return np.polynomial.chebyshev.chebval(x, coefficients)

def predict_future_chebyshev(data, start_date, months_to_predict=12, degree=1):
    x_vals = [datetime.timestamp(datetime.strptime(d[0], "%Y-%m")) for d in data]
    y_vals = [d[1] for d in data]
    
    future_data = []
    for i in range(months_to_predict):
        future_date = start_date + timedelta(days=30 * i)
        future_timestamp = datetime.timestamp(future_date)
        
        predicted_value = chebyshev_interpolation(x_vals, y_vals, future_timestamp, degree)
        future_data.append((future_date.strftime("%Y-%m"), predicted_value))
    
    return future_data


async def main():
    async with aiohttp.ClientSession() as session:

        gus_task = fetch_public_api(session)
        blockchain_task = fetch_blockchain_api(session)

        gus, blockchain = await asyncio.gather(gus_task, blockchain_task)

        print("Dane z API GUS:")
        print(gus)
        print("\nDane z API blockchain:")
        print(blockchain)

        gus_future = predict_future_chebyshev(gus, datetime.strptime(gus[-1][0], '%Y-%m') + timedelta(days=30), degree=2)
        blockchain_future = predict_future_chebyshev(blockchain, datetime.strptime(blockchain[-1][0], '%Y-%m') + timedelta(days=30), degree=2)
        gus.extend(gus_future)
        blockchain.extend(blockchain_future)

        gus_dates, gus_values = zip(*gus)
        blockchain_dates, blockchain_values = zip(*blockchain)
        fig, ax1 = plt.subplots(figsize=(14, 8))

        ax1.plot(gus_dates, gus_values, label="Inflacja GUS")
        ax1.set_ylabel("Inflacja %")
        ax1.set_xlabel("Data")

        ax2 = ax1.twinx()
        ax2.plot(blockchain_dates, blockchain_values, label="Dane Blockchain", color="green")
        ax2.set_ylabel("Cena BTC")
        ax2.tick_params(axis="y", labelcolor="green")

        fig.suptitle("Inflacja")
        ax1.legend(loc="upper left")
        ax2.legend(loc="upper right")

        plt.tight_layout()
        plt.show()

if __name__ == "__main__":
    asyncio.run(main())