if status is-interactive
    # Commands to run in interactive sessions can go here
end

# aliases
alias rmrf="rm -rf"
alias obsidian="flatpak run md.obsidian.Obsidian"

# paths
set -x ANDROID_SDK_ROOT "$HOME/Android/Sdk"
set -x ANDROID_HOME "$ANDROID_SDK_ROOT"
set -x ANDROID_NDK_HOME "/home/parth/Android/Sdk/ndk/29.0.13599879/"
set -x NDK_HOME "/home/parth/Android/Sdk/ndk/29.0.13599879/"
set PATH "$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH"
set -x JAVA_HOME "/opt/android-studio/jbr"

set PATH "/home/parth/flutterSDK/bin:$PATH"
set PATH "/opt/android-studio/bin/:$PATH"
set PATH "$PATH:/home/parth/flutter/bin"
set PATH "$PATH:$(go env GOPATH)/bin"

# starship
starship init fish | source

# android build caching
set -x USE_CCACHE 1
set -x CCACHE_EXEC "/usr/bin/ccache"
