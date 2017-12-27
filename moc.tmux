#!/usr/bin/env bash

PLUGIN_DIR="$( cd "$( dirname "$0" )" && pwd )"
PLUGIN_BASE="$( basename "$0" )"
PLUGIN="$PLUGIN_DIR/$PLUGIN_BASE"

patterns=(
    "\#{moc_title}"
    "\#{moc_artist}"
    "\#{moc_state}"
    "\#{moc_song}"
    "\#{moc_album}"
    "\#{moc_time_total}"
    "\#{moc_time_total_second}"
    "\#{moc_time_left}"
    "\#{moc_time_current}"
    "\#{moc_time_current_second}"
    "\#{moc_file_name}"
    "\#{moc_file_bitrate}"
    "\#{moc_file_rate}"
)

string=(
    "#($PLUGIN title)"
    "#($PLUGIN artist)"
    "#($PLUGIN state)"
    "#($PLUGIN song)"
    "#($PLUGIN album)"
    "#($PLUGIN tt)"
    "#($PLUGIN ts)"
    "#($PLUGIN tl)"
    "#($PLUGIN ct)"
    "#($PLUGIN cs)"
    "#($PLUGIN file)"
    "#($PLUGIN b)"
    "#($PLUGIN r)"
)

update_a_tmux_option () {
    local key="$1"
    local value="$(tmux show-options -gqv "$key")"
    for i in $(seq 0 "${#patterns[@]}"); do
        value=${value//${patterns[$i]}/${string[$i]}}
    done
    tmux set-option -gq "$key" "$value"
}

main() {
    if [ -z "$1" ]; then
        type mocp >/dev/null 2>&1 || exit 1
        update_a_tmux_option "status-right"
        update_a_tmux_option "status-left"
    else
        echo "$(mocp -Q \%$1 2>/dev/null)"
    fi
}

main $1
