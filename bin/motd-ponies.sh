#!/bin/sh

# Which machine are we on?
PONY="`uname -n`"

# Rewrite a couple of machine names to their ponysay names.
if [ "$PONY" == "rainbowdash" ]; then
    PONY="rainbow"
elif [ "$PONY" == "pinkiepie" ]; then
    PONY="pinkie"
fi

# If it isn't a name we know about, use Derpy. You done derped.
if [ "$PONY" != "applejack" ] && [ "$PONY" != "rainbow" ] && [ "$PONY" != "pinkie" ] && [ "$PONY" != "rarity" ] && [ "$PONY" != "fluttershy" ] && [ "$PONY" != "twilight" ]; then
    PONY="derpysit"
fi

# Pipe fortune through ponysay with the appropriate pony.
fortune -s | ponysay -f $PONY
