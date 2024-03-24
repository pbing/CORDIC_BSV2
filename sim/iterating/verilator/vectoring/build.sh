#!/bin/zsh
verilator --cc \
          --exe \
          --build \
          --trace-fst --trace-depth 1 \
          -y ../../../../verilog \
          -y $BLUESPECDIR/Verilog \
          -CFLAGS "-DVL_NO_LEGACY -std=c++20" \
          mkCORDIC_v.v \
          verilator.vlt \
          Request.cpp \
          Response.cpp \
          sim_main.cpp
