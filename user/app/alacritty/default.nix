{ settings, ... }:

{
  home.file.".config/alacritty/alacritty.toml".text = ''
live_config_reload = true

[bell]
animation = "EaseOutExpo"
duration = 0

[colors]
draw_bold_text_with_bright_colors = true

[[colors.indexed_colors]]
color = "0xF8BD96"
index = 16

[[colors.indexed_colors]]
color = "0xF5E0DC"
index = 17

[colors.bright]
black = "0x988BA2"
blue = "0x96CDFB"
cyan = "0x89DCEB"
green = "0xABE9B3"
magenta = "0xF5C2E7"
red = "0xF28FAD"
white = "0xD9E0EE"
yellow = "0xFAE3B0"

[colors.cursor]
cursor = "0xF5E0DC"
text = "0x1E1D2F"

[colors.normal]
black = "0x6E6C7E"
blue = "0x96CDFB"
cyan = "0x89DCEB"
green = "0xABE9B3"
magenta = "0xF5C2E7"
red = "0xF28FAD"
white = "0xD9E0EE"
yellow = "0xFAE3B0"

[colors.primary]
background = "0x1E1D2F"
foreground = "0xD9E0EE"

[cursor]
blink_interval = 500
blink_timeout = 5
unfocused_hollow = false

[cursor.style]
blinking = "Off"
shape = "Block"

[env]
TERM = "xterm-256color"

[font]
size = 18

[font.bold]
family = "JetBrainsMono Nerd Font"
style = "Bold"

[font.glyph_offset]
x = 0
y = 0

[font.italic]
family = "JetBrainsMono Nerd Font"

[font.normal]
family = "MesloLGS NF"

[font.offset]
x = 0
y = 0

[mouse]
hide_when_typing = true

[[mouse.bindings]]
action = "PasteSelection"
mouse = "Middle"

[selection]
semantic_escape_chars = ",│`|:\"' ()[]{}<>"

[shell]
program = "/etc/profiles/per-user/''+settings.user.username+''/bin/zsh"

[window]
decorations = "full"
dynamic_title = true
startup_mode = "Maximized"

[window.dimensions]
columns = 240
lines = 120

[window.padding]
x = 4
y = 4

  '';
}
