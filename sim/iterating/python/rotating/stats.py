import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

ITERATIONS = 12
SXY = 13
SZ = 16
FREQBIN = 1

# scale factor
A = 1.0
for i in range(ITERATIONS):
    A = A * np.sqrt(1.0 + 4**(-i))
print("A={}".format(A))

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
phi = (2 * np.pi * FREQBIN / N) * np.arange(N)
xr = A * ((2**(SXY-1)) - 1) * np.cos(phi)
yr = A * ((2**(SXY-1)) - 1) * np.sin(phi)
x = rsp.x - xr
y = rsp.y - yr
z = rsp.z

fig, ax = plt.subplots(nrows=2, sharex=True, layout="constrained")
fig.suptitle("Residual data")
ax[0].set_xlabel("θ")
ax[0].set_ylabel("LSB")
ax[0].plot(x)
ax[1].set_xlabel("θ")
ax[1].set_ylabel("LSB")
ax[1].plot(y)
fig.savefig("residual.png")
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

# mean
mean_x = np.mean(x)
mean_y = np.mean(y)
mean_z = np.mean(z)
print("mean(x)={} mean(y)={} mean(z)={}".format(mean_x, mean_y, mean_z))

# standard deviation
std_x = np.std(x)
std_y = np.std(y)
std_z = np.std(z)
print("std(x)={} std(y)={} std(z)={}".format(std_x, std_y, std_z))

# Quantile-quantile plot
rng = np.random.RandomState(0) # Seed RNG for replicability
qqx = rng.normal(mean_x, std_x, N)
qqy = rng.normal(mean_y, std_y, N)
qqz = rng.normal(mean_z, std_z, N)

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

# FFT
eps = np.full(N // 2 + 1, np.exp2(-5))
X = np.log2(np.maximum(np.abs(np.fft.rfft(rsp.x)) / N, eps))
Y = np.log2(np.maximum(np.abs(np.fft.rfft(rsp.y)) / N, eps))
Z = np.log2(np.maximum(np.abs(np.fft.rfft(rsp.z)) / N, eps))

fig, ax = plt.subplots(nrows=3, sharex=True, layout="constrained")
fig.suptitle("FFT raw")
ax[0].set_title("X")
ax[0].set_xlabel("bins")
ax[0].set_ylabel("LSB");
ax[0].plot(X)
ax[1].set_title("Y")
ax[1].set_xlabel("bins")
ax[1].set_ylabel("LSB");
ax[1].plot(Y)
ax[2].set_title("Z")
ax[2].set_xlabel("bins")
ax[2].set_ylabel("LSB");
ax[2].plot(Z)
fig.savefig("fft_raw.png")
plt.show()

# effective number of bits (ENOB)
def enob (x, n=1):
    # SINAD
    M = len(x)
    X = np.fft.rfft(x)
    X2 = np.square(np.absolute(X))
    Arms = X2[n] / (M * M)
    NAD = (np.sum(X2[1:n]) + np.sum(X2[n+1::])) / (M * (M - 3)) # no D.C., no fundamental frequency
    SINAD = Arms / NAD
    # ENOB
    ENOB = 0.5 * (np.log2(SINAD) - np.log2(1.5))
    return ENOB

print("ENOB(x)={} ENOB(y)={}".format(enob(rsp.x, FREQBIN), enob(rsp.y, FREQBIN)))
