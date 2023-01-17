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

soft_sed 's/--dark/--light/' \
        ~/.gitconfig

soft_sed 's/colors: "default"/colors: "onelight"/' \
        "${HOME}/.config/contour/contour.yml" \
        "${HOME}/.var/app/org.contourterminal.Contour/contour.yml"

soft_sed 's/set background=dark/set background=light/' \
        "${HOME}/.config/nvim/lua/user/colorscheme.lua"
