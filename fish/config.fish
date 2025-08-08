if status is-interactive
    # Commands to run in interactive sessions can go here
end

# aliases
alias rmrf="rm -rf"
alias qq="exit"
alias obsidian="flatpak run md.obsidian.Obsidian"

# paths
set PATH "$PATH:/home/parth/flutterSDK/bin"
set PATH "$PATH:/opt/android-studio/bin"
set PATH "$PATH:/home/parth/flutter/bin"
set PATH "$PATH:$(go env GOPATH)/bin"


# starship
starship init fish | source

# android build caching
set -x USE_CCACHE 1
set -x CCACHE_EXEC "/usr/bin/ccache"

# using a superior editor
set -x EDITOR "/usr/bin/nvim"

# go and bazel related stuff
set -x USE_BAZEL_VERSION 6.4.0
set -x JAVA_HOME /usr/lib/jvm/jre-21-openjdk

# ENV vars
set -x SHELL /usr/bin/fish
set -x EDITOR /usr/bin/nvim

# zellij related stuff
set -x ZELLIJ_AUTO_ATTACH "true"
set -x ZELLIJ_AUTO_EXIT "true"

# The following snippet is meant to be used like this in your fish config:
#
# if status is-interactive
#     # Configure auto-attach/exit to your likings (default is off).
#     # set ZELLIJ_AUTO_ATTACH true
#     # set ZELLIJ_AUTO_EXIT true
#     eval (zellij setup --generate-auto-start fish | string collect)
# end

if not set -q ZELLIJ
   if test "$ZELLIJ_AUTO_ATTACH" = "true"
       zellij attach -c
   else
       zellij
   end

   if test "$ZELLIJ_AUTO_EXIT" = "true"
       kill $fish_pid
   end
end
