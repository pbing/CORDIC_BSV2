import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

ITERATIONS = 16
SXY = 16
SZ = 16
FREQBIN = 1

# read data
rsp = pd.read_csv("rsp.csv")
N = len(rsp)
print("N={}".format(N))

fig, ax = plt.subplots(nrows=3, sharex=True, layout="constrained")
fig.suptitle("Raw data")
ax[0].set_title("X")
ax[0].set_xlabel("θ")
ax[0].set_ylabel("LSB")
ax[0].plot(rsp.x)
ax[1].set_title("Y")
ax[1].set_xlabel("θ")
ax[1].set_ylabel("LSB")
ax[1].plot(rsp.y)
ax[2].set_title("Z")
ax[2].set_xlabel("θ")
ax[2].set_ylabel("LSB")
ax[2].plot(rsp.z)
fig.savefig("raw.png")
plt.show()

# residual
z0 = np.arange(N)
z1 = np.where(z0 < 0, z0 - N, z0)
z2 = rsp.z - z1
x = rsp.x
y = rsp.y
z = np.where(z2 < -(N/2), z2 + N, z2)

plt.title("Residula data")
plt.xlabel("θ")
plt.ylabel("LSB")
plt.plot(z)
plt.savefig("residual.png")
plt.show()

# histogram
xrange = np.arange(np.min(x), np.max(x) + 2)
yrange = np.arange(np.min(y), np.max(y) + 2)
zrange = np.arange(np.min(z), np.max(z) + 2)

fig, ax = plt.subplots(ncols=3, sharey=True, layout="constrained")
fig.suptitle("Histogram")
ax[0].set_title("X")
ax[0].set_xlabel("LSB");
ax[0].set_ylabel("count");
ax[0].hist(x, xrange, align="left")
ax[1].set_title("Y")
ax[1].set_xlabel("LSB");
ax[1].set_ylabel("count");
ax[1].hist(y, yrange, align="left")
ax[2].set_title("Z")
ax[2].set_xlabel("LSB");
ax[2].set_ylabel("count");
ax[2].hist(z, zrange, align="left")
fig.savefig("histogram.png")
plt.show()

mean_x = np.mean(x)
mean_y = np.mean(y)
mean_z = np.mean(z)
print("mean(x)={} mean(y)={} mean(z)={}".format(mean_x, mean_y, mean_z))

std_x = np.std(x)
std_y = np.std(y)
std_z = np.std(z)
print("std(x)={} std(y)={} std(z)={}".format(std_x, std_y, std_z))

# Setup
rng = np.random.RandomState(0)  # Seed RNG for replicability

# Generate data
qqx = rng.normal(mean_x, std_x, N)
qqy = rng.normal(mean_y, std_y, N)
qqz = rng.normal(mean_z, std_z, N)

# Quantile-quantile plot
fig, ax = plt.subplots(nrows=2, ncols=2, layout="constrained")
fig.suptitle("Q-Q Plot")
ax[0][0].set_title("X")
ax[0][0].set_xlabel("LSB");
ax[0][0].set_ylabel("LSB");
ax[0][0].scatter(np.sort(qqx), np.sort(x))
ax[0][1].set_title("Y")
ax[0][1].set_xlabel("LSB");
ax[0][1].set_ylabel("LSB");
ax[0][1].scatter(np.sort(qqy), np.sort(y))
ax[1][0].set_title("Z")
ax[1][0].set_xlabel("LSB");
ax[1][0].set_ylabel("LSB");
ax[1][0].scatter(np.sort(qqz), np.sort(z))
ax[-1][-1].axis("off")
fig.savefig("qq-plot.png")
plt.show()
