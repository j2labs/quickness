# Quickness 11.10

This is a tool for deploying system configurations to Ubuntu systems easily. 
The "11.10" above maps the code here to Ubuntu 11.10. Things will be upgraded when new Ubuntu's come out.


## Just Launched A Box

After launching a fresh box, open a terminal on it and run the following steps.

    ubuntu@host:~$ sudo apt-get -y install git-core
    ubuntu@host:~$ git clone https://github.com/j2labs/quickness.git
    ubuntu@host:~$ source quickness/etc/profile.sh 

    ubuntu@host : 02:52:16 : ~
    Q: 

Your prompt will change to something colorful with a newline before the command entry point. `ls` is colorful too, along with other aliases. 

Quickness is also ready to go.


## Building A System

I usually build a system with a few commands. That looks like:

    ubuntu@host : 02:53:23 : ~
    Q: quick_new
    Q: quick_apply max_files
    Q: quick_install brubeck

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

These commands can be any kind of script, they just have to be in `quickness/bin`.


## Environment Configs

The `quickness/etc` directory is basically the basis for system configs.

For now these files still need editing in a deploy. They come with basic configs for typical use cases but the network addresses still need to be filled in.


## Formulas

The `quickness/formulas` directory is where the logic for deploying Brubeck, Node.js, etc is. 

The idea here is to think in terms of servers and say, "I need a Brubeck server" or "I need my usual Node deployment."

Eventually, the formulas, and any other relevant scripts, will be sent to one or more servers for executon.


## Tweaks

The `quickness/tweaks` directory is commands you run to flip switches in your operating system, like disabling NUMA or configuring some huge number of open file descriptors.

The tweaks each have comments documenting their purpose. It is my hopes that the tweaks can serve as teaching tools for interesting ways of configuring operating systems.


# Background

I have built many systems in my life. AWS has exacerbated this problem considerably, too.

It can be time consuming, but all hackers eventually automate their daily life, as redundant as their code might be to whatever is already out there. It starts as a few shell scripts. It grows into some shell functions and environment variables. And then you have a simple environment that installs things for you.

And then maybe you call it Quickness. And then you post it on your GitHub page. And it's really just a bunch of scripts that slap a system together.

*Why’d you write it in shell anyway? That’s weird.*

Well. It *does* capture the way I like systems to behave if they're fresh. Maybe you'll like the way my systems usually behave too?


# License

BSD, as usual. See LICENSE.md.
