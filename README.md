# Quickness

This is a tool for deploying system configurations to remote systems
easily.

It's just a few shell scripts for now, but I'm certain it will evolve as I figure out great ways to deploy and configure servers.

My current thoughts are that I will use parallel ssh pools with Jeff Forcier's [SSH](https://github.com/bitprophet/ssh). I also like the idea of using Kenneth Reitz's [envoy](https://github.com/kennethreitz/envot) project. People can write simple shell scripts for formulas or something more sophisticated with fabric, but the scripts are run as local scripts on the remote systems. 

I think this keeps it flexible in terms of how you want to write system building code, since it can be any language you want.

An implicit assumption is that all machines are expendible. This has been my experience on AWS and I want to carry that through into the tools I use. If you need a new box, just deploy it. If you need to run a few updates, try them on some temporary server and make sure they work. Then deploy across many and check the output for errors.

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

