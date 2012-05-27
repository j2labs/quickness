![Quickness](https://github.com/j2labs/quickness/raw/master/etc/logo.png)

This is a tool for deploying system configurations to Ubuntu systems easily. I use it on fresh Ubuntu boxes on AWS regularly. It also has a `Vagrantfile`, so you can build VirtualBox VM's and work from your laptop instead.

Quickness makes installing the big concepts, like entire environments, easier. It attempts to have good taste in what should be present and what shouldn't. An Erlang install, for example, will be similar to what everyone normally has.


## Installing

Installing Quickness is basically just cloning a repo and turning on the environment. 

You can use a fresh Ubuntu box from anywhere, including local VM's.

## New Remote Box

After launching a fresh box, SSH to it and run the following steps.

    ubuntu@host:~$ sudo apt-get -y install git
    ubuntu@host:~$ git clone https://github.com/j2labs/quickness.git
    ubuntu@host:~$ source quickness/etc/profile

    ubuntu@host : 02:52:16 : ~
    Q: 

Your prompt will change to something colorful with a newline before the command entry point. `ls` is colorful too, along with other aliases. 


## New Amazon ec2 Box (requires boto)

Create an environment variable named AWS\_IDENTITY which points to your amazon key.  Copy `samples/ec2.conf` to `ec2/private/ec2.conf` and update with your own preferences (files in etc/private are ignored by git)

    bin/quick_ec2server precise64 devbox

Give it a few extra minutes to bootstrap the environment.

    bin/quick_ec2 ssh devbox

If you login and don't see the quickness ascii art your environment is not ready, exit and wait a minute.


## Using Vagrant

Create a vagrant instance like this.

    $ git clone https://github.com/j2labs/quickness.git
    $ cd quickness
    $ vagrant up

Then SSH to the machine and you will have a quickness prompt ready to go.

    $ vagrant ssh
    Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic x86_64)

     * Documentation:  https://help.ubuntu.com/
       ____        _      _
      / __ \      (_)    | |
     | |  | |_   _ _  ___| | ___ __   ___ ___ ___
     | |  | | | | | |/ __| |/ / '_ \ / _ | __/ __|
     | |__| | |_| | | (__|   <| | | |  __|__ \__ \
      \___\_\\__,_|_|\___|_|\_\_| |_|\___|___/___/

    Last login: Mon May  7 19:16:13 2012 from 10.0.2.2
    vagrant@precise64 : 22:24:03 : ~
    Q: 

There's the quickness prompt again.


## Building A System

I usually build a system with a few commands. That looks like:

    Q: quick_apply max_files
    Q: . $Q/brubeck

Done.

For your convenience the `$Q` variable points to the formula directory to make sourcing formulas quite easy.


## Commands

After source'ing `quickness/etc/profile` you will have a few commands available to you. Each of them begin with `quick_` and live in `quickness/bin/`, so you can tab them out.

| **Command**       | **Function**                                                                                                         |
|------------------:|:---------------------------------------------------------------------------------------------------------------------|
| `quick_new`       | Run this command first. It bootstraps the system with things every developer needs.                                  |
| `quick_apply`     | This applies a system tweak. The word 'apply' is used to signal that these change a system's config.                 |
| `quick_tweaks`    | Lists all the available tweaks.                                                                                      |
| `quick_formulas`  | Lists all the concepts that have been captured as formulas.                                                          |
| `quick`           | Can be used to prefix commands to create the environment they need to run in. Generally used by other commands only. |
| `quick_instances` | Lists all ec2 instances that have been created with quickness.                                                       |
| `quick_ec2server` | Create an ec2 server as defined by etc/private/ec2.conf.                                                             |
| `quick_ec2`       | Allows you to ssh, reboot, start, stop and terminate a quickness ec2 instances.                                      |

These commands can be any kind of script, they just have to be in `quickness/bin`.  Use your Fabric scripts, or whatever you already have.


## Environment Configs

The `quickness/etc` directory is where vanilla system configs are stored. An install process might modify what's in here.

For now these files still need editing in a deploy. They come with basic configs for typical use cases but the network addresses still need to be filled in. They will eventually be based on templates.

By default quickness is configured to ignore any files in `etc/private`, so for sensitive data like a `.boto` file you can store it in `etc/private` and have your formula copy it to the right place ($HOME in this case)

During login `etc/profile` tries to source `etc/private/bash.profile`.  To get you started copy `samples/bash.profile` to `etc/private/bash.profile`.


## Formulas

The `quickness/formulas` directory is where the logic for deploying Brubeck, Node.js, etc is.

The idea here is to think in terms of servers and say, "I need a Brubeck server" or "I need my usual Node deployment."

Eventually, the formulas, and any other relevant scripts, will be sent to one or more servers for executon.

Remember any formulas ending in `_private` will be ignored by git, feel free to create custom formulas that need not be shared with the world.


## Tweaks

The `quickness/tweaks` directory is commands you run to flip switches in your operating system, like disabling NUMA or configuring some huge number of open file descriptors.

The tweaks each have comments documenting their purpose. I hope that the tweaks that come with quickness can serve as teaching tools for interesting ways of configuring systems.

Remember any tweaks ending in `_private` will be ignored by git, feel free to create custom tweaks that need not be shared with the world.


## Sudo

For now, `sudo` is used to install things. Quickness systems are assumed to be somewhat ad-hoc. I would like to remove the use of `sudo` and would like to hear what your thoughts are on how to do this best too.

Perhaps `sudo` can be used, or a virtualenv, or something with rvm / rbenv, or kerl and rebar, or whatever...


# Background

I have built many systems in my life. AWS has exacerbated this problem considerably, too.

It can be time consuming, but all hackers eventually automate their daily life, as redundant as their code might be to whatever is already out there. It starts as a few shell scripts. It grows into some shell functions and environment variables. And then you have a simple environment that has commands and installs things for you.

And then maybe you call it Quickness. And then you post it on your GitHub page. And it's really just a bunch of scripts that slap a system together.

*Why’d you write it in shell anyway? That’s weird.*

It *does* capture the way I like systems to behave if they're fresh. Maybe you'll like the way my systems usually behave too?


# License

BSD, as usual. See LICENSE.md.
