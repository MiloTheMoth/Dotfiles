if status is-interactive
    fastfetch
    starship init fish | source
end

set -U fish_greeting

fish_add_path /home/milo/.spicetify
