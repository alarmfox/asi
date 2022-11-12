# Integrated systems architecture
This repo contains VHDL projects and exercises from Integrated systems architecture course using [ghdl](http://ghdl.free.fr/)

## Building and simulating (Linux)
To build a project following steps are needed:
* go into project root;
* create build directory;
* build entities;

### Example: building and simulating mux16_4
```sh
cd mux16_4 # go into project root
mkdir build # create build directory
ghdl -a -v --ieee=synopsys --workdir=build/ *.vhd # compile all .vhd files
```

Run the following command to check if files were built:

```sh
ghdl --dir --workdir=build/
```

To simulate, running the following command:
```sh
ghdl -r --workdir=build/ --ieee=synopsys mux_16_1_tb --disp-time --vcd=build/mux_16_1_tb.vcd --stop-time=1000ns
```

Once the simulation has finished, waveforms can be seen with **gtkwave** passing the vcd file generated:

```sh
gtkwave build/mux_16_1_tb.vcd
```
