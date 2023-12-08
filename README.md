# About
A **vivid** and **colorful** 🎨 GTK theme based on [vinceliuice](https://github.com/vinceliuice)'s [Matcha GTK Theme](https://github.com/vinceliuice/Matcha-gtk-theme) and [sainnhe](https://github.com/sainnhe)'s [Edge Colorscheme](https://github.com/sainnhe/edge).

<details>
 <summary>Preview</summary>
 
  ![yellow](preview/Edge-light-yellow.png)
  ![blue](preview/Edge-blue.png)
  ![dark-red](preview/Edge-dark-red.png)
  ![dark-cyan](preview/Edge-dark-cyan.png)
  ![dark-purple](preview/Edge-dark-purple.png)
</details>

> ⚠️ Even though this theme is very usable, its still a WIP. There are some [loose ends](https://github.com/xelser/edge-gtk/issues/1) that needs to be addressed.

## Supports
- GTK 2,3, and 4 
- Cinnamon
- XFCE (xfwm)
- MATE (metacity)
- GNOME (gnome-shell)
> Soon, using [Gradiance](https://github.com/GradienceTeam/Gradience). Because it has better support in the long run.
- Preferred icon theme: [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) with Edge's [Papirus Folders](https://github.com/xelser/edge-papirus-folders) theme
# Install
#### Requirements for GTK2
- Arch: `sudo pacman -S gtk-engine-murrine gtk-engines`
- Fedora: `sudo dnf install gtk-murrine-engine gtk2-engines`
- Debian/Ubuntu: `sudo apt-get install gtk2-engines-murrine gtk2-engines-pixbuf`
## From Source
1. Clone the Repo
```sh
git clone https://github.com/xelser/edge-gtk && cd edge-gtk
```
2. Run the script
- For user installation: `./install.sh` [OPTIONS...]
- For global installation: `sudo ./install.sh` [OPTIONS...]

##### OPTIONS:

```sh
 -d, --dest DIR        Specify theme destination directory (Default: $HOME/.themes)
 -n, --name NAME       Specify theme name (Default: Edge)
 -c, --color VARIANTS  Specify theme color variant(s) [standard|dark] (Default: All variants)
 -t, --theme VARIANTS  Specify hue theme variant(s) [red|yellow|green|cyan|blue|purple] (Default: All variants)
 -r, --remove          Remove(Uninstall) themes
 -h, --help            Show this help
```

## GTK4
> Grab the directory of your selected theme (Ex. Edge-dark-blue). Either in `/usr/share/themes/` or in `$HOME/.themes/`
```sh
theme_dir="/usr/share/themes/Edge-dark-blue"

rm -rf                                     "$HOME/.config/gtk-4.0/{assets,gtk.css,gtk-dark.css}"
mkdir -p                                   "$HOME/.config/gtk-4.0"
ln -sf "${theme_dir}/gtk-4.0/assets"       "$HOME/.config/gtk-4.0/"
ln -sf "${theme_dir}/gtk-4.0/gtk.css"      "$HOME/.config/gtk-4.0/gtk.css"
ln -sf "${theme_dir}/gtk-4.0/gtk-dark.css" "$HOME/.config/gtk-4.0/gtk-dark.css"
```


## Flatpak
> ⚠️ Official Flatpak Package soon

### Using The Official [Flatpak Documentations](https://docs.flatpak.org/en/latest/desktop-integration.html) Instructions:
The directory of the theme should be present in `$HOME/.local/share/themes/` (anything in `/usr` is blacklisted). So you either have to copy from `/usr/share/themes` to `$HOME/.local/share/themes` ***OR*** if you installed it in `$HOME/.themes`, symlinking it to `$HOME/.local/share/themes` also works.
```sh
flatpak override --user --filesystem=xdg-config/gtk-3.0 # for gtk3
flatpak override --user --filesystem=xdg-config/gtk-4.0 # for gtk4
flatpak override --user --filesystem=xdg-data/themes:ro # theme directory
flatpak override --user --filesystem=$HOME/.themes:ro # theme directory
flatpak override --user --env=GTK_THEME=${gtk_theme} # apply theme (Ex. Edge-dark-blue)
```
> "So why install it to `$HOME/.themes` if flatpak wants it in `$HOME/.local/share/themes`?" Because GTK2 likes it in `$HOME/.themes`

### Using [Stylepak](https://github.com/refi64/stylepak)
```sh
stylepak install-user Edge-dark-blue
```
# Recommended and Related Projects

- More Edge projects: https://github.com/sainnhe/edge/wiki/Related-Projects
# Credits
- The beautiful [Edge Colorscheme](https://github.com/sainnhe/edge) by [sainnhe](https://github.com/sainnhe)
  - One of the famous colorscheme: [Atom's One Dark](https://github.com/atom/atom/tree/master/packages/one-dark-syntax)
  - [Material](https://github.com/material-theme/vsc-material-theme)
- [Matcha GTK Theme](https://github.com/vinceliuice/Matcha-gtk-theme) by [vinceliuice](https://github.com/vinceliuice) for the awesome work
  - One of the popular GTK theme: [Arc Theme](https://github.com/horst3180/Arc-theme)

This project wouldn't be possible without any of the above. Show them great support :heart:
# License
[GPL-3.0](./LICENSE) © xelser
