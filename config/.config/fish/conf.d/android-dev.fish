if test -d "/Applications/Android Studio.app/Contents/jbr/Contents/Home"
    set -x JAVA_HOME "/Applications/Android Studio.app/Contents/jbr/Contents/Home"
    fish_add_path -g $JAVA_HOME/bin
end

if test -d $HOME/Library/android/sdk
    set -x ANDROID_HOME $HOME/Library/android/sdk
    set -x ANDROID_SDK_ROOT $ANDROID_HOME # This is deprecated, but no harm in keeping it
    set -x ANDROID_NDK_ROOT $ANDROID_SDK_ROOT/ndk/current

    fish_add_path -g $ANDROID_HOME/platform-tools
    fish_add_path -g $ANDROID_HOME/cmdline-tools/latest/bin/
end
