Alternator
==========

Alternator helps you alternating between alternatives, so that you can control
wich files are executed by a program. It generates wrapper scripts to "stub"
executed files.


Usage
-----

If you want ruby19 to be run when `ruby` is called, execute alternator
like this:

    $ alternator wrap ruby ruby19

The following shell script will be written in `~/bin/ruby`:

    #!/usr/bin/env sh

    exec ruby19 $@

Then you prepend `~/bin` to your search path.


Requirements
------------

* ruby
* rubygems
* env
* sh (any POSIX shell should do it)


Installation
------------

    $ gem install alternator


FAQ
---

Q: Why?  
A: I wanted to run various ruby code under various ruby interpreters
   easily.

Q: Why not using RVM?  
A: First, the installation procedure don't look acceptable to me and as
   far as I know RVM is not available in any package management system.
   RVM requires that I change my shell configuration in such a way
   that I never needed to do for any other software. RVM depends on bash
   and I don't want to install a new shell on all my environments,
   especially not bash. RVM is aimed at managing rubies, I wanted my
   tool not to have this restriction.

Q: Why not using rbenv?  
A: I had great hope in rbenv, and I like the fact that it don't require
   to modify the shell configuration. But all the other things I don't
   like about RVM also apply to rbenv :-(


Notes
-----

If you only want to alternate between different rubies, here is a light
solution based on symlinks:
<http://chris.mowforth.com/si-because-rvm-and-rbenv-are-overkill>
