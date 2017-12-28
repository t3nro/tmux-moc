#!/usr/bin/env bash

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
    "#(mocp -Q %%title)"
    "#(mocp -Q %%artist)"
    "#(mocp -Q %%state)"
    "#(mocp -Q %%song)"
    "#(mocp -Q %%album)"
    "#(mocp -Q %%tt)"
    "#(mocp -Q %%ts)"
    "#(mocp -Q %%tl)"
    "#(mocp -Q %%ct)"
    "#(mocp -Q %%cs)"
    "#(mocp -Q %%file)"
    "#(mocp -Q %%b)"
    "#(mocp -Q %%r)"
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
    type mocp >/dev/null 2>&1 || exit 1
    update_a_tmux_option "status-right"
    update_a_tmux_option "status-left"
}

main
