#! /bin/bash

set -e

function soft_sed()
{
    local regex="${1}"
    shift
    for file in "${@}"; do
        if [[ -f "${file}" ]]; then
            echo "Updating file ${file} with ${regex}"
            sed -i -e "${regex}" "${file}"
        fi
    done
}

soft_sed 's/--light/--dark/' \
        ~/.gitconfig

soft_sed 's/colors: "onelight"/colors: "default"/' \
        "${HOME}/.config/contour/contour.yml" \
        "${HOME}/.var/app/org.contourterminal.Contour/contour.yml"

soft_sed 's/set background=light/set background=dark/' \
        "${HOME}/.config/nvim/lua/user/colorscheme.lua"
