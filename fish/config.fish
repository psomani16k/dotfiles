if status is-interactive
    # Commands to run in interactive sessions can go here
end

set PATH "/home/parth/flutterSDK/bin:$PATH"
set PATH "/opt/android-studio/bin:$PATH"

set ANDROID_SDK_ROOT "$HOME/Android/Sdk"
set ANDROID_HOME "$ANDROID_SDK_ROOT"
set ANDROID_NDK_HOME "/home/parth/Android/Sdk/ndk/26.3.11579264"
set PATH "$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH"

set PATH "$PATH:/home/parth/flutter/bin"
set PATH "$PATH:$(go env GOPATH)/bin"

starship init fish | source
