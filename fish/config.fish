if status is-interactive
    # Commands to run in interactive sessions can go here
end

# aliases
alias rmrf="rm -rf"
alias qq="exit"
alias obsidian="flatpak run md.obsidian.Obsidian"
alias clear="echo 'Please use CTRL+L'"

# paths
set PATH "$PATH:/home/parth/flutterSDK/bin"
set PATH "$PATH:/opt/android-studio/bin"
set PATH "$PATH:/home/parth/flutter/bin"
set PATH "$PATH:/home/parth/bin"
set PATH "$PATH:/opt/gradle/bin"
set PATH "$PATH:/home/parth/flutter/bin"
set PATH "$PATH:/home/parth/.bun/bin"
set PATH "$PATH:~/.nvm/versions/node/v18.20.8/bin"

# android
set -x ANDROID_HOME "$HOME/Android/Sdk"
set -x ANDROID_NDK_HOME "$ANDROID_HOME/ndk/27.3.13750724"
set -x NDK_HOME "$ANDROID_NDK_HOME"
set PATH "$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools"

# starship
starship init fish | source

# cargo bins
source ~/.cargo/env.fish

source ~/.ssh/api_keys.fish

# android build caching
set -x USE_CCACHE 1
set -x CCACHE_EXEC "/usr/bin/ccache"

# using a superior editor
set -x EDITOR "/usr/bin/nvim"

# go and bazel related stuff
set -x USE_BAZEL_VERSION 6.4.0
set -x JAVA_HOME /usr/lib/jvm/jre-25-openjdk

# The following snippet is meant to be used like this in your fish configuration:
# if status is-interactive
#     # Maybe set ZELLIJ_AUTO_ATTACH / ZELLIJ_AUTO_EXIT
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

set -x GITLAB_HOME /srv/gitlab
