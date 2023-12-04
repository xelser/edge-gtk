# About
A GTK theme based on [vinceliuice](https://github.com/vinceliuice)'s [Matcha GTK Theme](https://github.com/vinceliuice/Matcha-gtk-theme) and [sainnhe](https://github.com/sainnhe)'s [Edge Colorscheme](https://github.com/sainnhe/edge). 

This theme aims to be:
- **Cold** ❄️ 
- **Vivid** 🎨
- Easy on the eyes (soft contrast)
## Supports
- GTK 2,3, and 4 
- Cinnamon
- XFCE (xfwm)
- MATE (metacity)
- GNOME (gnome-shell)
> Soon, using [Gradiance](https://github.com/GradienceTeam/Gradience).
> Because it has better support in the long run.
# Install
## Requirements for GTK2
- Arch: `sudo pacman -S gtk-engine-murrine gtk-engines`
- Fedora: `sudo dnf install gtk-murrine-engine gtk2-engines`
- Debian/Ubuntu: `sudo apt-get install gtk2-engines-murrine gtk2-engines-pixbuf`
### From Source
1. Clone the Repo
```sh
git clone https://github.com/xelser/edge-gtk && cd edge-gtk
```
2. Run the script
```sh
./install.sh [OPTIONS...] # for user installation
```
```sh
sudo ./install.sh [OPTIONS...] # for global installation
```
#### OPTIONS:

```sh
 -d, --dest DIR        Specify theme destination directory (Default: $HOME/.themes)
 -n, --name NAME       Specify theme name (Default: Edge)
 -c, --color VARIANTS  Specify theme color variant(s) [standard|dark] (Default: All variants)
 -t, --theme VARIANTS  Specify hue theme variant(s) [red|yellow|green|cyan|blue|purple] (Default: All variants)
 -r, --remove          Remove(Uninstall) themes
 -h, --help            Show this help
```

## GTK4
```sh
rm -rf 				                             "$HOME/.config/gtk-4.0/{assets,gtk.css,gtk-dark.css}"
mkdir -p 				                           "$HOME/.config/gtk-4.0"
ln -sf "${theme_dir}/gtk-4.0/assets"       "$HOME/.config/gtk-4.0/"
ln -sf "${theme_dir}/gtk-4.0/gtk.css"      "$HOME/.config/gtk-4.0/gtk.css"
ln -sf "${theme_dir}/gtk-4.0/gtk-dark.css" "$HOME/.config/gtk-4.0/gtk-dark.css"
```
> ${theme_dir} is the directory of your selected theme (Ex. Edge-light-purple). Either in `/usr/share/themes/` or in `$HOME/.themes/`

## Flatpak
The directory of the theme should be present in `$HOME/.local/share/themes/` as per [Flatpak Documentations](https://docs.flatpak.org/en/latest/desktop-integration.html) (anything in `/usr` is blacklisted). So you either have to copy from `/usr/share/themes` to `$HOME/.local/share/themes` ***OR*** if you installed it in `$HOME/.themes`, symlinking it to `$HOME/.local/share/themes` also works.
```sh
flatpak override --user --filesystem=xdg-config/gtk-3.0 # for gtk3
flatpak override --user --filesystem=xdg-config/gtk-4.0 # for gtk4
flatpak override --user --filesystem=xdg-data/themes:ro # theme directory
flatpak override --user --filesystem=$HOME/.themes:ro # theme directory
flatpak override --user --env=GTK_THEME=${gtk_theme} # apply theme (Ex. Edge-light-purple)
```
> "So why install it to `$HOME/.themes` if flatpak wants it in `$HOME/.local/share/themes`?" Because GTK2 likes it in `$HOME/.themes`

# Related Projects
- Preferred icon theme: [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
> papirus-folder theme coming soon.
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
