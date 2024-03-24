#!/bin/zsh
verilator --cc \
          --exe \
          --build \
          --trace-fst --trace-depth 1 \
	  --no-timing \
          -y ../../../../verilog \
          -y $BLUESPECDIR/Verilog \
          -CFLAGS "-DVL_NO_LEGACY -std=c++20 $(gsl-config --cflags)" \
          -LDFLAGS "$(gsl-config --libs)" \
          mkPipelineCORDIC_r.v \
          verilator.vlt \
          Request.cpp \
          Response.cpp \
          sim_main.cpp
