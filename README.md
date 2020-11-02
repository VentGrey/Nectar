### Introduction

Nectar is a Fedy (Fedora Tool) derivative aimed for new Pop! OS users.

The Pop! Os default shop app comes with a handful of packages, ideal to install both .deb and flatpak
packages, however it still has some minor issues that I'd like to correct myself but, being unable to
program in Vala and Meson I decided to use this project previously used in Funtoo Linux.

The current Pop Shop still has these issues:

* Anything outside pop-gtk theme looks broken.
* Flatpak and Deb installations are confusing sometimes.
* Some popular apps are Flatpak-installable only.
* No support for complete programming toolchains
* Heavy memory usage (Around 300 ~ 400 MB)
* Based on ElementaryOS technology and not compatible with other distros.

Nectar aims to provide a **VERY REDUCED** alternative for those who just want to install and forget. It doesn't
aim to replace pop shop in any way possible. Since packages are added manually this doesn't sync with repositories
outside itself. In exchange for that this can be extended to install third party .deb sources, flatpaks and even
snaps (Though, pop! os doesn't like snap and neither do I).

### Installation

Installation instructions can be found below.

_Do not follow instructions from any other source!_

```
# Test in local folder

make run

# Install system wide

sudo make install

```

### Usage

After installation, search for `Nectar` in the menu/overview or type `nectar` in the terminal.

### Plugin structure

Plugins can be placed under `~/.local/share/nectar/plugins/`, or the system plugins directory.

Each plugin is a directory with the suffix `.plugin`, which consist of a JSON formatted metadata file. The metadata file contains information about the plugin and describes how `nectar` should run the tasks.

The plugins can run any command or scripts (`bash`, `python` etc.). In addtion to the system commands, `Nectar` provides an additional command, `run-as-root` to allow running commands (e.g.- `run-as-root touch /some/file/somewhere`) or scripts (e.g.- `run-as-root -s do-stuff.sh`) as root.

Have a look at the existing plugins to know more about how to write plugins for `Nectar`.

### Source code

Source code is publicly available on GitHub:

```
$ git clone https://github.com/VentGrey/Nectar
```


### Bugs and feature requests

Please submit bugs and feature requests [here][nectar/issues]. Pull requests are
always welcome.

[nectar/issues]: https://github.com/VentGrey/Nectar/issues

### License

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see [gnu.org/licenses](http://www.gnu.org/licenses/).
