#!/bin/zsh

# Set the desired font in iTerm2 using AppleScript
osascript <<EOF
tell application "iTerm"
    activate
    delay 1
    set newFont to "Hack Nerd Font"
    tell current session of current window
        set font name to newFont
    end tell
end tell
EOF

# Import iTerm2 profiles from ~/.dotfiles/iterm2 to the iTerm2 DynamicProfiles directory
cp /Users/$(whoami)/.dotfiles/iterm2/iterm2-profiles.json /Users/$(whoami)/Library/Application\ Support/iTerm2/DynamicProfiles/

echo "iTerm2 font set to 'Hack Nerd Font' and profiles imported successfully."

