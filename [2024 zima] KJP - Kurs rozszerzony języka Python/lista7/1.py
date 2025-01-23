import asyncio
import aiohttp
import private

async def fetch_public_api(session):
    url = "https://energy-instrat-api.azurewebsites.net/api/prices/energy_price_rdn_hourly"
    params = {
        "date_from": "25-11-2024T00:00:00Z",
        "date_to": "25-11-2024T23:59:59Z",
    }
    async with session.get(url, params=params) as response:
        data = await response.json()
        return [hour['fixing_i']['price'] for hour in data]

async def fetch_private_api(session):
    url = f"http://api.weatherapi.com/v1/history.json"
    params = {
        "q": "Poland",
        "key": private.WEATHER_API_KEY,
        "dt": "2024-01-25"
    }
    async with session.get(url, params=params) as response:
        data = await response.json()
        return [(hour['wind_kph'], hour['cloud']) for hour in data['forecast']['forecastday'][0]['hour']]

async def main():
    async with aiohttp.ClientSession() as session:

        energy_prices_task = fetch_public_api(session)
        weather_task = fetch_private_api(session)

        energy_prices, weather = await asyncio.gather(energy_prices_task, weather_task)

        print("Dane z publicznego API:")
        print(energy_prices)
        print("\nDane z API wymagającego uwierzytelnienia:")
        print(weather)

        for i in range(24):
            print(f"{'0'+str(i) if i<10 else i}:00 Wiatr {weather[i][0]} km/h, zachmurzenie {weather[i][1]}% => {energy_prices[i]} PLN/MWh")

if __name__ == "__main__":
    asyncio.run(main())