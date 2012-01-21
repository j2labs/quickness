# Homebru

This is a tool for deploying system configurations to remote systems
easily.

It isn't much yet, but I'm certain it will evolve.

## Formulas

The `/formulas` directory is where the logic for deploying Brubeck, Node.js, etc is. 

The idea here is to think in terms of servers and say, "I need a Brubeck server" or "I need something to run Siege quickly and then go away".

Eventually, the formulas, and any other relevant scripts, will be sent to one or more servers for executon.

## Service Configs

The `/etc` directory is basically the basis for system configs.

For now these files still need editing in a deploy. They come with basic configs for typical use cases but the network addresses still need to be filled in.

## Tweaks

The `/tweaks` directory is commands you run to flip switches in your system, like disabling NUMA or setting some number of open file descriptors.

The tweaks will have comments documenting their purpose, but they should only be executed by formulas. Each formula is responsible for which system tweaks it wants to take advantage of. 

## Final Note

These ideas (and naming) are all rough, but I already find the scripts useful.

If you write your own formulas, I recommend trying them on a single instance before deploying across many.

