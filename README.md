![Quickness](etc/logo.png)

This is a tool for deploying system configurations to Ubuntu systems easily. It also has a `Vagrantfile` so you can build VirtualBox VM's with it too.


## Just Launched A Remote Box

After launching a fresh box, open a terminal on it and run the following steps.

    ubuntu@host:~$ sudo apt-get -y install git-core
    ubuntu@host:~$ git clone https://github.com/j2labs/quickness.git
    ubuntu@host:~$ source quickness/etc/profile.sh 

    ubuntu@host : 02:52:16 : ~
    Q: 

Your prompt will change to something colorful with a newline before the command entry point. `ls` is colorful too, along with other aliases. 


## Using Vagrant

Create a vagrant instance like this.

    $ git clone https://github.com/j2labs/quickness.git
    $ cd quickness
    $ vagrant up
    
Then SSH to the machine and you will have a quickness prompt ready to go.

    $ vagrant ssh
    Linux lucid64 2.6.32-33-server #70-Ubuntu SMP Thu Jul 7 22:28:30 UTC 2011 x86_64 GNU/Linux
    Ubuntu 10.04.3 LTS

    Welcome to the Ubuntu Server!
    * Documentation:  http://www.ubuntu.com/server/doc
    Last login: Sat Mar 31 09:32:49 2012 from 10.0.2.2
    
    ubuntu@host : 02:52:16 : ~
    Q: 


## Building A System

I usually build a system with a few commands. That looks like:

    Q: quick_new
    Q: quick_apply max_files
    Q: quick_install brubeck

Done.


## Commands

After source'ing `quickness/etc/profile.sh` you will have a few commands available to you. Each of them begin with `quick_` and live in `quickness/bin/`, so you can tab them out.

| **Command**      | **Function**                                                                                                         |
|-----------------:|:---------------------------------------------------------------------------------------------------------------------|
| `quick_new`      | Run this command first. It bootstraps the system with things every developer needs.                                  |
| `quick_apply`    | This applies a system tweak. The word 'apply' is used to signal that these change a system's config.                 |
| `quick_tweaks`   | Lists all the available tweaks.                                                                                      |
| `quick_install`  | Installs a formula, which is to say it runs a script which installs 1 or more packages.                              |                          
| `quick_formulas` | Lists all the concepts that have been captured as formulas.                                                          |
| `quick`          | Can be used to prefix commands to create the environment they need to run in. Generally used by other commands only. |

These commands can be any kind of script, they just have to be in `quickness/bin`.  Use your Fabric scripts, or whatever you already have.


## Environment Configs

The `quickness/etc` directory is where vanilla system configs are stored. An install process might modify what's in here.

For now these files still need editing in a deploy. They come with basic configs for typical use cases but the network addresses still need to be filled in. They will eventually be based on templates.


## Formulas

The `quickness/formulas` directory is where the logic for deploying Brubeck, Node.js, etc is. 

The idea here is to think in terms of servers and say, "I need a Brubeck server" or "I need my usual Node deployment."

Eventually, the formulas, and any other relevant scripts, will be sent to one or more servers for executon.


## Tweaks

The `quickness/tweaks` directory is commands you run to flip switches in your operating system, like disabling NUMA or configuring some huge number of open file descriptors.

The tweaks each have comments documenting their purpose. I hope that the tweaks that come with quickness can serve as teaching tools for interesting ways of configuring systems.


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
