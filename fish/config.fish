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


