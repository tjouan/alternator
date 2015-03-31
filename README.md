Alternator
==========

Alternator helps you alternating between alternatives, so that you can
control which files are executed by a program. It generates wrapper
scripts to "stub" executed files.


2015 update: unmaintained, limited usefulness
---------------------------------------------

I never really used this program, the project was in part written as
learning purpose and I prefer to rely on dirty shell hacks, as some
programming environments need to be handled in very different and
specific ways regarding version or packages management.

Example extracted from a `~/.zshenv` for ruby:

```zsh
zopt_os=$(uname)

if [[ $zopt_os = FreeBSD ]]; then
  zopt_ruby_default_version=22
elif [[ $zopt_os = Linux ]]; then
  zopt_ruby_default_version=2.1.5
fi

(($+CHRUBY_VERSION)) || export CHRUBY_VERSION=$zopt_ruby_default_version
function chruby() {
  if [[ -n $1 ]]; then
    if [[ "$1" = "init" ]]; then
      if [[ $zopt_os = FreeBSD ]]; then
        export RB_USER_INSTALL=1
      fi
      export GEM_HOME=$HOME/.gem/ruby/$CHRUBY_VERSION
      export PATH=$GEM_HOME/bin:$PATH
    else
      export CHRUBY_VERSION=$1
    fi

    export PATH=${PATH#$GEM_HOME/bin:}
    export GEM_HOME=$HOME/.gem/ruby/$CHRUBY_VERSION
    export GEM_PATH=$GEM_HOME
    export PATH=$GEM_HOME/bin:$PATH

    for c in ruby irb ri; do
      eval "function ${c}_$CHRUBY_VERSION() { ${c}$CHRUBY_VERSION \$@ }"
      alias $c=${c}_$CHRUBY_VERSION
    done
  else
    echo "Version:  $CHRUBY_VERSION"
    echo "PATH:     $PATH"
    echo "GEM_HOME: $GEM_HOME"
    echo "GEM_PATH: $GEM_PATH"
    type ruby
    type gem
  fi
}
chruby init
```

Other example extracted from `~/.zshrc`:

```zsh
for c in ruby gem irb ri; do
  compdef _$c ${c}_$CHRUBY_VERSION=$c
done

bundled_gem_bin=(
  cucumber
  guard
  mutant
  rackup
  rake
  rspec
  shotgun
  spork
  unicorn
)

function bundle_exec() {
  if [[ -f Gemfile ]]; then
    bundle exec $@
  else
    $@
  fi
}

for c in $bundled_gem_bin; do
  eval "function bundler_$c() { bundle_exec $c \$@ }"
  alias $c=bundler_$c

  if which _$c > /dev/null 2>&1; then
    compdef _$c bundler_$c=$c
  fi
done
```


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
A: First, the installation procedure don't look acceptable to me and
   as far as I know RVM is not available in any package management
   system.  RVM requires that I change my shell configuration in such
   a way that I never needed to do for any other software. RVM depends
   on bash and I don't want to install a new shell on all my
   environments, especially not bash. RVM is aimed at managing rubies,
   I wanted my tool not to have this restriction.

Q: Why not using rbenv?  
A: I had great hope in rbenv, and I like the fact that it don't
   require to modify the shell configuration. But all the other things
   I don't like about RVM also apply to rbenv :-(


Notes
-----

If you only want to alternate between different rubies, here is a light
solution based on symlinks:
<http://chris.mowforth.com/si-because-rvm-and-rbenv-are-overkill>
