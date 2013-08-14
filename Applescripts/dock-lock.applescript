do shell script Â
	"defaults write com.apple.Dock contents-immutable -bool yes"
do shell script Â
	"defaults write com.apple.Dock size-immutable -bool yes"
do shell script Â
	"defaults write com.apple.Dock position-immutable -bool yes"

tell application "Dock" to quit