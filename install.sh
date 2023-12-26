#! /usr/bin/env bash

ROOT_UID=0
DEST_DIR=

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
  DEST_DIR="/usr/share/themes"
else
  DEST_DIR="$HOME/.themes"
fi

REO_DIR="$(cd $(dirname "$0") && pwd)"
SRC_DIR="${REO_DIR}/src"

THEME_NAME=Edge
COLOR_VARIANTS=('' '-light' '-dark')
THEME_VARIANTS=('-red' '-yellow' '-green' '-blue' '-purple' '-cyan')

usage() {
  printf "%s\n" "Usage: $0 [OPTIONS...]"
  printf "\n%s\n" "OPTIONS:"
  printf "  %-25s%s\n" "-d, --dest DIR" "Specify theme destination directory (Default: ${DEST_DIR})"
  printf "  %-25s%s\n" "-n, --name NAME" "Specify theme name (Default: ${THEME_NAME})"
  printf "  %-25s%s\n" "-c, --color VARIANTS" "Specify theme color variant(s) [standard|light|dark] (Default: All variants)"
  printf "  %-25s%s\n" "-t, --theme VARIANTS" "Specify hue theme variant(s) [red|yellow|green|blue|purple|cyan] (Default: All variants)"
  printf "  %-25s%s\n" "-r, --remove" "Remove(Uninstall) themes"
  printf "  %-25s%s\n" "-h, --help" "Show this help"
}

# Copying files
install() {
  local dest="${1}"
  local name="${2}"
  local color="${3}"
  local theme="${4}"

  local themedir="${dest}/${name}${theme}${color}"
	
  [[ ${color} == '-dark' ]] && local ELSE_DARK="${color}"
  [[ ${color} == '-light' ]] && local ELSE_LIGHT="${color}"

  [[ -d "${themedir}" ]] && rm -rf "${themedir}"

  echo "Installing '${themedir}'..."
  mkdir -p                                                                            "${themedir}"

  # Install index.theme
  echo "[Desktop Entry]"                                                           >> "${themedir}/index.theme"
  echo "Type=X-GNOME-Metatheme"                                                    >> "${themedir}/index.theme"
  echo "Name=${name}${theme}${color}"                                              >> "${themedir}/index.theme"
  echo "Comment=A dark modern design theme"                                        >> "${themedir}/index.theme"
  echo "Encoding=UTF-8"                                                            >> "${themedir}/index.theme"
  echo ""                                                                          >> "${themedir}/index.theme"
  echo "[X-GNOME-Metatheme]"                                                       >> "${themedir}/index.theme"
  echo "GtkTheme=${name}${theme}${color}"                                          >> "${themedir}/index.theme"
  echo "MetacityTheme=${name}${theme}${color}"                                     >> "${themedir}/index.theme"
  echo "IconTheme=Papirus"                                                  			 >> "${themedir}/index.theme"
  echo "CursorTheme=Qogir-manjaro"                                                 >> "${themedir}/index.theme"
  echo "ButtonLayout=menu:minimize,maximize,close"                                 >> "${themedir}/index.theme"

  # Install GTK+ 2.0 Theme
  mkdir -p                                                                            "${themedir}/gtk-2.0"
  cd "${SRC_DIR}/gtk-2.0"
  cp -r {apps.rc,main.rc,panel.rc,xfce-notify.rc}                                     "${themedir}/gtk-2.0"
  cp -r "gtkrc${color}${theme}"                                                       "${themedir}/gtk-2.0/gtkrc"
  cp -r assets${ELSE_DARK}${theme}                                                    "${themedir}/gtk-2.0/assets"
  cp -r "menubar-toolbar${ELSE_DARK}.rc"                                              "${themedir}/gtk-2.0/menubar-toolbar.rc"

  # Install GTK+ 3.0 Theme
  mkdir -p                                                                            "${themedir}/gtk-3.0"
  cd "${SRC_DIR}/gtk"
  cp -r "assets${theme}"                                                              "${themedir}/gtk-3.0/assets"
  cp -r "gtk-3.0/gtk${color}${theme}.css"                                             "${themedir}/gtk-3.0/gtk.css"
  cp -r "gtk-3.0/gtk-dark${theme}.css"                                                "${themedir}/gtk-3.0/gtk-dark.css"

  cp -r "thumbnail${ELSE_DARK}${theme}.png"                                           "${themedir}/gtk-3.0/thumbnail.png"

  # Install GTK+ 4.0 Theme
  mkdir -p                                                                            "${themedir}/gtk-4.0"
  cp -r "gtk-4.0/gtk${color}${theme}.css"                                             "${themedir}/gtk-4.0/gtk.css"
  cp -r "gtk-4.0/gtk-dark${theme}.css"                                                "${themedir}/gtk-4.0/gtk-dark.css"
  cd "${themedir}/gtk-4.0"
  ln -sf ../gtk-3.0/assets  assets
  ln -sf ../gtk-3.0/thumbnail.png thumbnail.png

  # Install CINNAMON Theme
  mkdir -p                                                                            "${themedir}/cinnamon"
  cd "${SRC_DIR}/cinnamon"
  cp -r "cinnamon${ELSE_DARK}${theme}.css"                                            "${themedir}/cinnamon/cinnamon.css"
  cp -r "thumbnail${ELSE_DARK}${theme}.png"                                           "${themedir}/cinnamon/thumbnail.png"

  cd "${SRC_DIR}/cinnamon/assets${theme}"
  cp -r common-assets                                                                 "${themedir}/cinnamon"
  cp -r "assets${ELSE_DARK}"                                                          "${themedir}/cinnamon/assets"
  
  # Install Metacity Theme
  mkdir -p                                                                            "${themedir}/metacity-1"
  cd "${SRC_DIR}/metacity-1"
  cp -r {thumbnail.png,*.svg,metacity-theme-3.xml}                                    "${themedir}/metacity-1"
  cp -r "metacity-theme-1${theme}.xml"                                                "${themedir}/metacity-1/metacity-theme-1.xml"

  cd "${themedir}/metacity-1"
  ln -s metacity-theme-1.xml metacity-theme-2.xml

  # Install xfwm4 Theme
  mkdir -p                                                                            "${themedir}/xfwm4"
  cd "${SRC_DIR}/xfwm4"
  cp -r "assets${color}${theme}"/*.png                                                "${themedir}/xfwm4"

  if [[ "${color}" == '-light' ]] ; then
    cp -r "themerc${color}"                                                           "${themedir}/xfwm4/themerc"
  else
    cp -r "themerc${theme}"                                                           "${themedir}/xfwm4/themerc"
  fi

  # Install xfwm4 hdpi Theme
  mkdir -p                                                                            "${themedir}-hdpi/xfwm4"
  cp -r "assets${color}${theme}-hdpi"/*.png                                           "${themedir}-hdpi/xfwm4"

  if [[ "${color}" == '-light' ]] ; then
    cp -r "themerc${color}"                                                           "${themedir}-hdpi/xfwm4/themerc"
  else
    cp -r "themerc${theme}"                                                           "${themedir}-hdpi/xfwm4/themerc"
  fi

  # Install xfwm4 xhdpi Theme
  mkdir -p                                                                            "${themedir}-xhdpi/xfwm4"
  cp -r "assets${color}${theme}-xhdpi"/*.png                                          "${themedir}-xhdpi/xfwm4"

  if [[ "${color}" == '-light' ]] ; then
    cp -r "themerc${color}"                                                           "${themedir}-xhdpi/xfwm4/themerc"
  else
    cp -r "themerc${theme}"                                                           "${themedir}-xhdpi/xfwm4/themerc"
  fi
}

while [[ $# -gt 0 ]]; do
  case "${1}" in
    -d|--dest)
      dest="$(realpath "${2}")"
      if [[ ! -d "${dest}" ]]; then
        echo "ERROR: Destination directory does not exist."
        exit 1
      fi
      shift 2
      ;;
    -n|--name)
      name="${2}"
      shift 2
      ;;
    -r|--remove|-u|--uninstall)
      remove='true'
      shift
      ;;
    -t|--theme)
      shift
      for theme in "${@}"; do
        case "${theme}" in
          red)
            themes+=("${THEME_VARIANTS[0]}")
            shift 1
            ;;
          yellow)
            themes+=("${THEME_VARIANTS[1]}")
            shift 1
            ;;
          green)
            themes+=("${THEME_VARIANTS[2]}")
            shift 1
            ;;
          blue)
            themes+=("${THEME_VARIANTS[3]}")
            shift 1
            ;;
          purple)
            themes+=("${THEME_VARIANTS[4]}")
            shift 1
            ;;
          cyan)
            themes+=("${THEME_VARIANTS[5]}")
            shift 1
            ;;
          -*|--*)
            break
            ;;
          *)
            echo "ERROR: Unrecognized thin variant '$1'."
            echo "Try '$0 --help' for more information."
            exit 1
            ;;
        esac
      done
      ;;
    -c|--color)
      shift
      for color in "${@}"; do
        case "${color}" in
          standard)
            colors+=("${COLOR_VARIANTS[0]}")
            lcolors+=("${COLOR_VARIANTS[0]}")
            gcolors+=("${COLOR_VARIANTS[0]}")
            shift
            ;;
          light)
            colors+=("${COLOR_VARIANTS[1]}")
            lcolors+=("${COLOR_VARIANTS[1]}")
            gcolors+=("${COLOR_VARIANTS[1]}")
            shift
            ;;
          dark)
            colors+=("${COLOR_VARIANTS[2]}")
            lcolors+=("${COLOR_VARIANTS[2]}")
            gcolors+=("${COLOR_VARIANTS[2]}")
            shift
            ;;
          -*|--*)
            break
            ;;
          *)
            echo "ERROR: Unrecognized color variant '$1'."
            echo "Try '$0 --help' for more information."
            exit 1
            ;;
        esac
      done
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "ERROR: Unrecognized installation option '$1'."
      echo "Try '$0 --help' for more information."
      exit 1
      ;;
  esac
done

uninstall() {
  local dest="${1}"
  local name="${2}"
  local color="${3}"
  local theme="${4}"

  local THEME_DIR="${1}/${2}${3}${4}"

  [[ -d "$THEME_DIR" ]] && rm -rf "$THEME_DIR" && echo -e "Uninstalling "$THEME_DIR" ..."
}

install_theme() {
  for color in "${colors[@]:-${COLOR_VARIANTS[@]}}"; do
    for theme in "${themes[@]:-${THEME_VARIANTS[@]}}"; do
      install "${dest:-${DEST_DIR}}" "${name:-${THEME_NAME}}" "${color}" "${theme}"
    done
  done
}

uninstall_theme() {
  for color in "${colors[@]:-${COLOR_VARIANTS[@]}}"; do
    for theme in "${themes[@]:-${THEME_VARIANTS[@]}}"; do
      uninstall "${dest:-$DEST_DIR}" "${name:-$THEME_NAME}" "${color}" "${theme}"
    done
  done
}

if [[ "${gdm:-}" != 'true' ]]; then
  if [[ "${remove:-}" != 'true' ]]; then
    install_theme
  else
		uninstall_theme
  fi
fi

echo "Finished!..."
