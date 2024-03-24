# Description

Synthesizeable CORDIC processor in Bluespec SystemVerilog (BSV)

## Quickstart

### Create an environment for BSC
```shell
source env.sh
```

### Simulate with bsc
```shell
bsc -sim -u -g mkTb ./test/Tb1.bsv
bsc -sim -e mkTb
./bsim [-m 30] [-V]
```
or
```shell
./run.sh ./test/Tb1.bsv  [-m 30] [-V]
```

### Create RTL
```shell
bsc -verilog -u ./test/Modules.bsv
```
or
```shell
./mkRTL.sh ./test/Modules.bsv
```

### Simulate with Verilator
```shell
cd sim/iterating/verilator/rotating
./build.sh
./run.sh
```

#### Simulated errors
Error calculation was done with Verilator.
Inputs are x0, y0 and z0. Outputs are x, y and z.
A = 1.6467...

|  mode                                                      | x0            | y0            | z0 | x           | y        | z |
|------------------------------------------------------------|---------------|---------------|----|-------------|----------|---|
| [rotating](sim/iterating/verilator/rotating/Request.cpp)   | 0x0fff        | 0             | θ  | A·cos(θ)    | A·sin(θ) | 0 |
| [vectoring](sim/iterating/verilator/vectoring/Request.cpp) | 0x7fff·cos(θ) | 0x7fff·sin(θ) | 0  | A·0x7fff    | 0        | θ |


|  mode                                                       | xerr     | yerr     | zerr     | xenob     | yenob     |
|-------------------------------------------------------------|----------|----------|----------|-----------|-----------|
| [rotating](sim/iterating/verilator/rotating/Response.cpp)   | 2.187728 | 2.173759 | 2.980018 | 10.813678 | 10.813678 |
| [vectoring](sim/iterating/verilator/vectoring/Response.cpp) | 3.814692 | 1.310590 | 1.041388 | -         | -         |

#### Statistics and graphical plots
A more comprehensive check can be obtained afterwards with the following Python script.
```shell
cd sim/iterating/python/rotating
python3 stats.py
```

## References
* [CORDIC (Wikipedia)](https://en.wikipedia.org/wiki/CORDIC)
* [Ray Andraka, A survey of CORDIC algorithms for FPGA based computers.](http://www.andraka.com/files/crdcsrvy.pdf)
* [CORDIC processor](https://github.com/pbing/CORDIC)
