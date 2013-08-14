do shell script Â
	"defaults write com.apple.Dock contents-immutable -bool no"
do shell script Â
	"defaults write com.apple.Dock size-immutable -bool no"
do shell script Â
	"defaults write com.apple.Dock position-immutable -bool no"

tell application "Dock" to quit