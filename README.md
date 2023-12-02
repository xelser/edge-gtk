# About
A ❄️ **cold**,🎨 **vivid** but has a **soft** feel GTK theme based on [vinceliuice](https://github.com/vinceliuice)'s [Matcha GTK Theme](https://github.com/vinceliuice/Matcha-gtk-theme) and [sainnhe](https://github.com/sainnhe)'s [Edge Colorscheme](https://github.com/sainnhe/edge)
## Supports
- GTK2, GTK3, GTK4, XFCE, Cinnamon, Mate
### GNOME (gnome-shell)
> Soon, using Gradiance Palette
# Usage
## Install
### Requirements for GTK2
- Arch: `sudo pacman -S gtk-engine-murrine gtk-engines`
- Fedora: `sudo dnf install gtk-murrine-engine gtk2-engines`
- Debian/Ubuntu: `sudo apt-get install gtk2-engines-murrine gtk2-engines-pixbuf`
#### From Source
1. Clone the Repo
```sh
git clone https://github.com/xelser/Edge-GTK && cd Edge-GTK
```
2. Run the script
```sh
./install.sh [OPTIONS...]
```
OPTIONS:

```sh
  -d, --dest DIR           Specify theme destination directory (Default: $HOME/.themes)
  -n, --name NAME          Specify theme name (Default: Edge)
  -c, --color VARIANTS     Specify theme color variant(s) [standard|dark] (Default: All variants)
  -t, --theme VARIANTS     Specify hue theme variant(s) [red|yellow|green|cyan|blue|purple] (Default: All variants)
  -r, --remove             Remove(Uninstall) themes
  -h, --help               Show this help
```
## Flatpak
## GTK4
### Related Projects
- https://github.com/sainnhe/edge/wiki/Related-Projects
# Credits
- [Edge Colorscheme](https://github.com/sainnhe/edge) by [sainnhe](https://github.com/sainnhe)
  - [Atom's One Dark](https://github.com/atom/atom/tree/master/packages/one-dark-syntax)
  - [Material](https://github.com/material-theme/vsc-material-theme)
- [Matcha GTK Theme](https://github.com/vinceliuice/Matcha-gtk-theme) by [vinceliuice](https://github.com/vinceliuice)
  - [Arc Theme](https://github.com/horst3180/Arc-theme)
# License
[GPL-3.0](./LICENSE) © xelser
