# reds bash script


## Description

"reds" that stands for **red** from **s**ource,  can compile both `red` and `reds` (red/system) scripts. It requires the red source folder. By default it is supposed to be in `~/Github/red` since it is the default location for Github repositories cloned from Github.

You can download it here: [reds](https://raw.githubusercontent.com/rcqls/reds/master/reds)

## Requirement

* A bash script system: since a good practice is to create folder `~/bin` and add it to your `$PATH` by updating your `~/.bash_profile` (or similar `~/.profile` or whatever else depending of your shell binary), I will consider it as the default for the rest of this documentation. Otherwise, it is easy to adapt to your particular case.

```
mkdir ~/bin
echo `export PATH=$PATH:~/bin` > ~/.bash_profile
```

* You need to have [`rebol`](http://rebol.com/download.html) and copy it in `~/bin` 
* For linux user willing red/GTK: see [here](https://github.com/rcqls/reds/README-RedGTK.md)
* A `red` source folder:
```

mkdir -p ~/Github
cd ~/Github
git clone https://github.com/red/red
# if you intend to test GTK branch
git checkout origin/GTK # user mode (no modification expected, useful for reds script)
# or
git checkout GTK # developer mode
```
Other alternative is red GTK development by rcqls: 

```
git clone https://github.com/rcqls/red
git checkout origin/GTK-dev # user mode
```

* Optionally you can also clone `code` and `community` repositories 

```
mkdir -p ~/Github
cd ~/Github
git clone https://github.com/red/code
git clone https://github.com/red/community
```

## How to use it

`reds` has almost the same options for compilation offered by the official `red` binary. It is only intended for compilation.

To compile a script do as you would do with `red` binary.

### for red/GTK user

The first and main action for red/GTK user is to create a new `console-view` binary.

```{bash}
cd ~/bin
reds -r ~/Github/red/environment/console/CLI/console-view.red
```

Don't forget that cross-compilation is a key-feature of `red`. So providing a linux `console-view` when you are on macOS or Windows is as easy as:

```{bash}
cd <folder> # different from ~/bin
reds -r -t Linux ~/Github/red/environment/console/CLI/console-view.red
```

###  Examples of compilation

```
reds -r ~/Github/code/Scripts/mandelbrot-fast.red
reds -r ~/Github/code/Scripts/perlin.red
```

## Options

If you have several red source folder, for instance in `~/tmp/red`, you could use this red source folder using `--root` option specific to `reds` bash script.

```
# console-view
reds --root ~/temp/red -r ~/Github/red/environment/console/CLI/console-view.red
# mandelbrot-fast
reds --root ~/temp/red -r ~/Github/code/Scripts/mandelbrot-fast.red
```