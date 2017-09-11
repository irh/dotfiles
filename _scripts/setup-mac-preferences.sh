if [[ "$OSTYPE" != "darwin"* ]]; then
  exit
fi

# Preferences

# Set up the dock
defaults write com.apple.dock persistent-apps -array; # remove icons in Dock
defaults write com.apple.dock tilesize -int 36; # smaller icon sizes in Dock
defaults write com.apple.dock autohide -bool true; # turn Dock auto-hidng on
defaults write com.apple.dock autohide-delay -float 0; # remove Dock show delay
defaults write com.apple.dock autohide-time-modifier -float 0; # remove Dock show delay
defaults write com.apple.dock orientation left; # place Dock on the left side of screen

# Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Set default Finder location to home folder (~/)
defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
  defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true && \
  defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true && \
  defaults write com.apple.finder ShowMountedServersOnDesktop -bool true && \
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Use blank homepage
defaults write com.apple.Safari HomePage -string "about:blank"

# Enable tap to click (Trackpad) for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Show battery percentage in menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Disable ducking autocorrect
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Show battery percentage in menubar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
# Follow the keyboard focus while zoomed in
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# Disable sounds
defaults write -g "com.apple.sound.beep.feedback" -int 0
defaults write "com.apple.systemsound" "com.apple.sound.uiaudio.enabled" -int 0
defaults write com.apple.mail MailSentSoundPath /devnull


killall Dock 2>/dev/null;
killall Finder 2>/dev/null;
killall NotificationCenter 2>/dev/null;
killall -HUP SystemUIServer 2>/dev/null;

