# Quickness 11.10

This is a tool for deploying system configurations to Ubuntu systems easily. 
The "11.10" above maps the code here to Ubuntu 11.10. Things will be upgraded when new Ubuntu's come out.

It's just a few shell scripts for now, but I'm certain it will evolve as I
figure out great ways to deploy and configure servers.


## Just Launched A Box

After launching a fresh box, open a terminal on it and run the following steps.

    ubuntu@host:~$ sudo apt-get -y install git-core
    ubuntu@host:~$ git clone https://github.com/j2labs/quickness.git
    ubuntu@host:~$ source quickness/etc/profile.sh 

    ubuntu@host : 02:52:16 : ~
    $ 

Your prompt will change to something colorful with a newline before the command entry point. `ls` is colorful too, along with other aliases. 

Quickness is also ready to go.


## Building A System

I usually build a system with a few commands. That looks like:

    ubuntu@host : 02:53:23 : ~
    $ quick_new
    ...
    $ quick_apply max_files
    $ quick_install brubeck

Done.


## Commands

After source'ing `quickness/etc/profile.sh` you will have a few commands available to you. Each of them begin with `quick_` as a prefix, so you can tab them out.

| **Command**      | **Function**                                                                                          |
|-----------------:|:------------------------------------------------------------------------------------------------------|
| `quick_new`      | Run this command first. It bootstraps the system with things every developer needs.                   |
| `quick_apply`    | This applies a system tweak. The word 'apply' is used to signal that these change a system's config.  |
| `quick_tweaks`   | Lists all the available tweaks.                                                                       |
| `quick_install`  | Installs a formula, which is to say it runs a script which installs 1 or more packages.               |                          
| `quick_formulas` | Lists all the concepts that have been captured as formulas.                                           |


## Environment Configs

The `/etc` directory is basically the basis for system configs.

For now these files still need editing in a deploy. They come with basic configs for typical use cases but the network addresses still need to be filled in.


## Formulas

The `/formulas` directory is where the logic for deploying Brubeck, Node.js, etc is. 

The idea here is to think in terms of servers and say, "I need a Brubeck server" or "I need my usual Node deployment."

Eventually, the formulas, and any other relevant scripts, will be sent to one or more servers for executon.


## Tweaks

The `/tweaks` directory is commands you run to flip switches in your operating system, like disabling NUMA or configuring some huge number of open file descriptors.

The tweaks each have comments documenting their purpose. It is my hopes that the tweaks can serve as teaching tools for interesting ways of configuring operating systems.


## License

BSD, as usual.
