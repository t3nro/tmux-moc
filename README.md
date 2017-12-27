# tmux-moc

Enables displaying information about the song being played by [MOC](http://moc.daper.net/) in tmux status-left/right.

## Installation

If you use [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)
you can simply add
```tmux
set -g @plugin 't3nro/tmux-moc'
```
to your `.tmux.conf` and hit `PREFIX` + <kbd>I</kbd> to clone and source the plugin.


## Usage

Add format strings to the `status-left` or `status-right` option in your `.tmux.conf`.

| Format string                | MOC query string |
|------------------------------|------------------|
| `#{moc_state}`               | %state           |
| `#{moc_title}`               | %title           |
| `#{moc_artist}`              | %artist          |
| `#{moc_song}`                | %song            |
| `#{moc_album}`               | %album           |
| `#{moc_time_total}`          | %tt              |
| `#{moc_time_total_second}`   | %ts              |
| `#{moc_time_left}`           | %tl              |
| `#{moc_time_current}`        | %ct              |
| `#{moc_time_current_second}` | %cs              |
| `#{moc_file_name}`           | %file            |
| `#{moc_file_bitrate}`        | %b               |
| `#{moc_file_rate}`           | %r               |

