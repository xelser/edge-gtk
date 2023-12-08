#! /bin/bash

THEME_DIR=$HOME/.themes/

THEME_NAME=Edge

_COLOR_VARIANTS=('' '-light' '-dark')
_THEME_VARIANTS=('-red' '-yellow' '-green' '-cyan' '-blue' '-purple')

if [ ! -z "${COLOR_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi

if [ ! -z "${THEME_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _THEME_VARIANTS <<< "${THEME_VARIANTS:-}"
fi

Tar_themes() {
for theme in "${_THEME_VARIANTS[@]}"; do
  rm -rf ${THEME_NAME}${color}${theme}.tar.xz
done

for theme in "${_THEME_VARIANTS[@]}"; do
  for color in "${_COLOR_VARIANTS[@]}"; do
		tar -Jcvf ${THEME_NAME}${color}${theme}.tar.xz ${THEME_NAME}${color}${theme}{,-hdpi,-xhdpi}
  done
done
}

Clear_theme() {
for theme in "${_THEME_VARIANTS[@]}"; do
  for color in "${_COLOR_VARIANTS[@]}"; do
    [[ -d "${THEME_NAME}${color}${theme}" ]] && rm -rf "${THEME_NAME}${color}${theme}"
    [[ -d "${THEME_NAME}${color}${theme}-hdpi" ]] && rm -rf "${THEME_NAME}${color}${theme}-hdpi"
    [[ -d "${THEME_NAME}${color}${theme}-xhdpi" ]] && rm -rf "${THEME_NAME}${color}${theme}-xhdpi"
  done
done
}

./install.sh -d $THEME_DIR

cd $THEME_DIR && Tar_themes && Clear_theme

