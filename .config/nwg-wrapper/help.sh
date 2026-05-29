#!/bin/sh
# Render the Mod+? cheat-sheet as Pango markup for nwg-wrapper.
#
# Bindings + their categories come from the `## Category // Action // Keys ##`
# comments in the Sway config, parsed by sbdp.py. Unlike the stock one-liner
# (which printed a flat list), this groups by category with a bold header per
# group. Categories are emitted alphabetically; rows keep config order within
# a category. Column alignment relies on the overlay CSS using a MONOSPACE
# font (JetBrainsMono Nerd Font) — see help.css.

/usr/share/sway/scripts/sbdp.py "$HOME/.config/sway/config" \
  | jq --raw-output '.[] | [.category, .action, .keybinding] | @tsv' \
  | sort -t "$(printf '\t')" -k1,1 -s \
  | awk -F '\t' '
      BEGIN {
        printf "<span size=\"x-large\" foreground=\"#ffffff\" weight=\"bold\">Keybindings</span>\n"
      }
      $1 != cat {
        cat = $1
        printf "\n<span size=\"large\" foreground=\"#6699cc\" weight=\"bold\">%s</span>\n", cat
      }
      { printf "  %-46s <b>%s</b>\n", $2, $3 }
    '
