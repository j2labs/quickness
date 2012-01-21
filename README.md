# Homebru

This is a tool for deploying system configurations to remote systems
easily.

It isn't much yet, but I'm certain it will evolve.

## Service Configs

The `/etc` directory is basically the basis for system configs. For now these files still need editing in a deploy. That'll change soon enough.

## Tweaks

The `/tweaks` directory is commands you run to flip switches in your system, like disabling NUMA or setting some number of open file descriptors.

## Formulas

the /formulas directory is where the logic for deploying brubeck, node.js, tornado or siege. the idea here is that we think in terms of servers and say, "i need a brubeck server" or "i need something to run siege quickly and then go away". 

## Final Note

These ideas (and naming) are all rough, but I already find the scripts useful.
