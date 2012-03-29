# Quickness

This is a tool for deploying system configurations to remote systems
easily.

It's just a few shell scripts for now, but I'm certain it will evolve as I figure out great ways to deploy and configure servers.

After launching a fresh box, SSH to it and run the following steps to install Quickness.

    ubuntu@host:~$ sudo apt-get install git-core
    ubuntu@host:~$ git clone https://github.com/j2labs/quickness.git
    ubuntu@host:~$ source quickness/etc/profile.sh 

    ubuntu@host : 02:52:16 : ~
    $ 

Your prompt will change to something colorful and informative.

## Commands

After source'ing `quickness/etc/profile.sh` you will have a few commands available to you. Each of them begin with `quick_` as a prefix, so you can tab them out.

| **Command**      | **Function**                                                                                          |
|-----------------:|:------------------------------------------------------------------------------------------------------|
| `quick_new`      | This is the first command you should run. It bootstraps the system with things every developer needs. |
| `quick_apply`    | This applies a system tweak. The word 'apply' is used to signal that these change a system's config.  |
| `quick_tweaks`   | Lists all the available tweaks.                                                                                               |
| `quick_install`  | Installs a formula, which is to say it runs a series of steps from a script.                          |
| `quick_formulas` | Lists all the concepts that have been captured in a shell script.                                     |

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

