# taco's super awesome frosted flake(s)

it's grrrreat! [^1]

[![nix - basically black magic](https://img.shields.io/static/v1?logo=nixos&logoColor=d8dee9&label=Nix(OS)&labelColor=5e81ac&message=basically%20black%20magic&color=d8dee9&style=for-the-badge)](https://nixos.org)
[![made with - out pants](https://img.shields.io/static/v1?label=Made%20with&message=out%20pants&color=red&style=for-the-badge)](https://www.youtube.com/watch?v=dQw4w9WgXcQ&pp=ygUJcmljayByb2xs)

> this whole repository is a work in progress and may change at any time.
> be ye warned!

## overview

hey what's up mtv welcome to my crib

i made a nix configuration to manage my life.
nix is pretty crazy, [you should check it out!](https://nixos.org/learn.html)
declarative stuff is definitely the future.

it's way easier to throw these up on GitHub and just pull
them down whenever i need them, so have them for free!
you're welcome. i know. i'm too kind.

all of these directories
(and some of these files)
are self-documented (hopefully).
read the `README`s and you should have a good time.
if you're not having a good time,
want me to explain something better,
or have feedback in general,
let me know in the [issues](github.com/takouhai/dotfiles/issues).
your thoughts and opinions are welcome!

## table of contents

here's what this repository currently holds:

### [home](home.nix)

home configuration, powered by home-manager.

### [flake.nix](flake.nix)

what makes this all happen, powered by nix flakes!

### [archive](archive/)

the graveyard, powered by the neverending approach of time.

> don't get me wrong, i like you checking out my stuff.
> but these instructions are mainly for me to install on my own machines.
> these aren't guaranteed to work on your machine at all.
> you can use then for reference, but don't expect them to work
> out of the box on your laptop/desktop/toaster.

## install

you should probably [install nix or have nixos installed already](https://nixos.org/download.html).

### linux

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

we install it as a daemon because daemons never stop.[^2]

### macOS

```bash
sh <(curl -L https://nixos.org/nix/install)
```

from there, i clone this repository into my `~/.dotfiles` directory.

```bash
git clone git@github.com:takouhai/dotfiles.git ~/.dotfiles
```

after that, i run the update commands below in a shell with those commands available.
usually i'm on a host with nix, so popping open a nix shell with the appropriate flake i need
(usually just home-manager)
is enough to get me off the ground, home/shell-wise.
you can find out how to enable flakes on your system/nix configuration [here](https://nixos.wiki/wiki/Flakes#Enable_flakes).

```bash
nix shell nixpkgs#home-manager
```

## update

once you start, you can't stop! seriously, help me.

### home

```bash
home-manager switch --flake .#taco
```

that should get you to the mountain, rock and roll.[^4]

the zsh shell has some provided shortcuts to update the current setup as you're using it.
you can use `updateHome` and `updateNix` to automatically reload based on the config.
you're really just running the above commands through these shortcuts, though.

```bash
updateHome
updateChannel
updateAll
```

take a look at [the source code](packages/zsh/default.nix) to see what's happening.

## license

don't worry, i got you. this'll be simple.

all of this is under the [wtfpl](LICENSE.md).
feel free to do wtf you want with them.
if you want, you can mention that i made these
and link back to this repository to help others learn nix,
but that's entirely optional!

[^1]: [cereal isn't that great for you, actually.](https://www.webmd.com/a-to-z-guides/news/20221013/7-cereals-can-no-longer-claim-healthy-label)
[^2]:
    > 'Daemons,' they call them. They perform action without user interaction. Monitoring, logging, notifications, primal urges, repressed memories, unconscious habits. They're always there, always active. You can try to be right, you can try to be good, you can try to make a difference. But it's all bullshit. 'Cause intentions are irrelevant. They don't drive us, daemons do. And me? I've got more than most.[^3]

[^3]: [`1.3_5-da3monsneverstop.caf`](https://www.youtube.com/watch?v=cPH53hOU4pA)
[^4]: [rock and roll!](https://www.youtube.com/watch?v=eOofWzI3flA)
