#! /bin/bash

set -e

function soft_sed()
{
    local regex="${1}"
    shift
    for file in "${@}"; do
        if [[ -f "${file}" ]]; then
            real_file=$(realpath "${file}")
            echo "Updating file ${file} with ${regex}"
            sed -i -e "${regex}" "${real_file}"
        fi
    done
}

soft_sed 's/--light/--dark/' \
        "${HOME}/.gitconfig"

soft_sed 's/colors: "onelight"/colors: "default"/' \
        "${HOME}/.config/contour/contour.yml" \
        "${HOME}/.var/app/org.contourterminal.Contour/config/contour/contour.yml"

soft_sed 's/set background=light/set background=dark/' \
        "${HOME}/.config/nvim/lua/user/colorscheme.lua"
