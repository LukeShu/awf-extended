# AWF - A widget factory (extended)

A widget factory is a theme preview application for GTK. It displays the various widget types provided by GTK in a single window allowing to see the visual effect of the applied theme.

## Screenshots

GTK 2\
[![Preview with GTK 2 - Main window](images/thumbs/gtk2.png?raw=true)](images/gtk2.png?raw=true)
[![Preview with GTK 2 - Menu](images/thumbs/gtk2-menu.png?raw=true)](images/gtk2-menu.png?raw=true)

GTK 3\
[![Preview with GTK 3 - Main window](images/thumbs/gtk3.png?raw=true)](images/gtk3.png?raw=true)
[![Preview with GTK 3 - Menu](images/thumbs/gtk3-menu.png?raw=true)](images/gtk3-menu.png?raw=true)

GTK 4 (experimental)\
[![Preview with GTK 4 - Main window](images/thumbs/gtk4.png?raw=true)](images/gtk4.png?raw=true)
[![Preview with GTK 4 - Menu](images/thumbs/gtk4-menu.png?raw=true)](images/gtk4-menu.png?raw=true)

The theme used for the screenshots is available [here](https://github.com/luigifab/human-theme). Pango 1.42 for screenshots with GTK 2 and 3, Pango 1.48 for screenshots with GTK 4.

* Some options are available from command line (read -h).
* The options menu allow to run some standard dialogs.
* The plus toolbar button allow to show or hide: arrows on notebooks, text on progress bars and scales, marks on scales.
* The refresh toolbar button and the refresh menu item allow to reload the current theme (like the sighup signal).
* The menu items keyboard shortcut can be updated on hover (GTK 2.24 and 3.0-3.24, *gtk-can-change-accels*).
* For Ubuntu, the menu items keyboard shortcut can be updated on hover with: `export UBUNTU_MENUPROXY= && awf-gtk3`

## Installation

It require **GTK 2.24+** or **GTK 3.0+** *(including 3.24)* or **GTK 4.0+** *(experimental)*, and *GLIB 2.28+*.

* Debian and Ubuntu: `sudo apt install awf-gtk2 awf-gtk3 awf-gtk4` (coming soon or via [PPA](https://launchpad.net/~luigifab/+archive/ubuntu/packages))

* Fedora: `sudo dnf install awf-gtk2 awf-gtk3 awf-gtk4`

* The *build.sh* script will compile the program with all major GTK versions available: `sudo apt install build-essential dh-autoreconf intltool libgtk2.0-dev libgtk-3-dev libgtk-4-dev` or `sudo dnf install autoconf automake gtk2-devel gtk3-devel gtk4-devel` then: `bash build.sh`

* The *debian-gtkx/deb.sh* scripts will compile the program and create Debian packages: `sudo apt install dpkg-dev devscripts build-essential dh-make dh-autoreconf intltool libgtk2.0-dev libgtk-3-dev libgtk-4-dev` then: `bash debian-gtkx/deb.sh`

* The *fedora-gtkx/rpm.sh* scripts will compile the program and create Fedora packages: `sudo dnf install rpmdevtools rpm-sign autoconf automake gtk2-devel gtk3-devel gtk4-devel` then: `bash fedora-gtkx/rpm.sh`

## PPA

Installation for Debian and Ubuntu with [PPA](https://launchpad.net/~luigifab/+archive/ubuntu/packages):
```
sudo add-apt-repository ppa:luigifab/packages
sudo apt update
sudo apt install awf-gtk2 awf-gtk3 awf-gtk4
 -- or --
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys FFE5BD439356DF7D
echo "deb http://ppa.launchpad.net/luigifab/packages/ubuntu hirsute main" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install awf-gtk2 awf-gtk3 awf-gtk4
 -- or --
sudo wget -O /etc/apt/trusted.gpg.d/luigifab.gpg https://www.luigifab.fr/apt.gpg
echo "deb http://ppa.launchpad.net/luigifab/packages/ubuntu hirsute main" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install awf-gtk2 awf-gtk3 awf-gtk4
```

```bash
# sha256sum /etc/apt/trusted.gpg.d/luigifab.gpg
578c89a677048e38007462d543686b53587efba9f93814601169253c45ff9213
# apt-key list
/etc/apt/trusted.gpg.d/luigifab.gpg
pub   rsa4096 2020-10-31 [SC]
      458B 0C46 D024 FD8C B8BC  99CD FFE5 BD43 9356 DF7D
```

## Dev

To reload theme when source files change, you can use [Entr](https://github.com/eradman/entr) with the *sighup* signal:
```
sudo apt install entr  or  sudo dnf install entr
ls ~/.themes/yourtheme/gtk-3.0/*.css | entr killall -s SIGHUP awf-gtk3
```

## Copyright

- Current version: 2.3.0 (04/04/2021)
- Compatibility: GTK 2.24 / 3.0 / 3.2 / 3.4 / 3.6 / 3.8 / 3.10 / 3.12 / 3.14 / 3.16 / 3.18 / 3.20 / 3.22 / 3.24 / 4.0
- Translations: English (en), French (fr)
- Links: [luigifab.fr](https://www.luigifab.fr/gtk/awf-extended) - [github.com](https://github.com/luigifab/awf-extended)\
[debian awf-gtk2.deb](https://tracker.debian.org/pkg/awf-gtk2)
  *([ITP](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=959434),
   [RFS](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=959897))*
; [debian awf-gtk3.deb](https://tracker.debian.org/pkg/awf-gtk3)
  *([ITP](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=959436),
   [RFS](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=959892))*
; [debian awf-gtk4.deb](https://tracker.debian.org/pkg/awf-gtk4)
  *([ITP](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=959433),
   [RFS](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=986360))*\
[fedora awf-gtk2.rpm](https://src.fedoraproject.org/rpms/awf-gtk2)
  *([RR](https://bugzilla.redhat.com/show_bug.cgi?id=1893321))*
; [fedora awf-gtk3.rpm](https://src.fedoraproject.org/rpms/awf-gtk3)
  *([RR](https://bugzilla.redhat.com/show_bug.cgi?id=1893323))*
; [fedora awf-gtk4.rpm](https://src.fedoraproject.org/rpms/awf-gtk4)
  *([RR](https://bugzilla.redhat.com/show_bug.cgi?id=1946092))*\
[launchpad PPA](https://launchpad.net/~luigifab/+archive/ubuntu/packages)

This program is provided under the terms of the **GNU GPLv3+** license.\
If you like, take some of your time to improve the translations, go to https://bit.ly/2HyCCEc.

## Credits

Forked from [awf](https://github.com/valr/awf) by Valère Monseur (valr).
