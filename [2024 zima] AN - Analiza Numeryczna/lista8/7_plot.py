import matplotlib.pyplot as plt

# Example data: Replace with your own 27 integers
plotX = [15.5, 12.5, 8, 10, 7, 4, 8, 10, 9.5, 14, 18, 17, 22, 25, 19, 24.5, 23, 17, 16, 12.5, 16.5, 21, 17, 11, 5.5, 7.5, 10, 12]
plotY = [32.5, 28.5, 29, 33, 33, 37, 39.5, 38.5, 42, 43.5, 42, 40, 41.5, 37, 35, 33.5, 29.5, 30.5, 32, 19.5, 24.5, 22, 15, 10.5, 2.5, 8, 14.5, 20]

# Create the scatter plot
plt.figure(figsize=(8, 6))  # Optional: Adjust the figure size
plt.scatter(plotX, plotY, color='blue', label='Points')

# Add labels, title, and legend
plt.xlabel('X-axis')
plt.ylabel('Y-axis')
plt.legend()
plt.grid(True)  # Optional: Add a grid
plt.show()