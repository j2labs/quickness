# Homebru

This is a tool for deploying system configurations to remote systems
easily.

It isn't much yet, but I'm certain it will evolve.

## Service Configs

The `/etc` directory is basically the basis for system configs. For now these files still need editing in a deploy. That'll change soon enough.

## Tweaks

The `/tweaks` directory is commands you run to flip switches in your system, like disabling NUMA or setting some number of open file descriptors.

## Formulas

The `/formulas` directory is where the logic for deploying Brubeck, Node.js, Tornado or Siege. The idea here is that we think in terms of servers and say, "I need a Brubeck server" or "I need something to run Siege quickly and then go away". 

## Final Note

These ideas (and naming) are all rough, but I already find the scripts useful.
