tell application "The Hit List" to quit

do shell script �
	"defaults write com.potionfactory.TheHitList sourceListWidth 185"

tell application "The Hit List" to launch