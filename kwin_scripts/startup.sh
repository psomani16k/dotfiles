#!/bin/bash

# start terminal 

kitty &

# start chrome

google-chrome &

# start slack

flatpak run com.slack.Slack &

# start spotify

flatpak run com.spotify.Client &

# start obsidian

flatpak run md.obsidian.Obsidian &
