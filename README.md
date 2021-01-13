# musescoreAHKExtensions

musescoreAHKExtensions is a function library that allows for easy interaction between AutoHotKey and MuseScore.  It is primarily based on the post made [here](https://musescore.org/en/node/303798) by MuseScore forum user @MichLeon.

License: MIT

Copyright (c) 2021 Noah McAllister

## Functions
### pruneStack
The function `pruneStack(posX, posY)` is a function that takes two inputs, `posX` and `posY`, where the inputs are the X Y coordinates relative to the Prune Stack plugin of the checkbox that you want to click.  It does not return a value, but gets the current mouse position, moves the mouse to `posX, posY`, and them moves the mouse back to its original position.  The sleep time between clicks can be adjusted from within the function.

The coordinates of the checkboxes and the delay can be changed in \lib\variables.ahk file.
##### Example
For example, I map the function to the numpad, with the NumpadSub opening the plugin.

```autohotkey
    NumpadSub:: ;opens prune stack
    #Include, %A_ScriptDir%\lib\variables.ahk
    Send, ^+!u
    MouseGetPos, PSInitX, PSInitY
    return
    
    Numpad1:: ;clicks 1
    pruneStack(pruneStack_Click1_X, pruneStack_Click1_Y, PS_delay)
    return
```

### insertPaletteItem
The function `insertPaletteItem(paletteCode, itemName, toolTipTime, IPE_delay)` is a function that takes four inputs, `paletteCode`, `itemName`, `IPE_toolTipTime`, and `IPE_delay`. `paletteCode` is the unique identifier for the palette item; it is also the value (right of the equals sign) in \lib\paletteList.ini. `itemName` is the name of the palette item that will be displayed as a tooltip; it is also the value of \lib\paletteDefinitions.ini. `IPE_toolTipTime` is the length of time the tooltip will be displayed for. `IPE_delay` is the amount of sleep time between commands to be executed.

The purpose of this function is to add any palette item to the score. In my script (and @MichLeon's original script), on a shortcut, an input box is generated  

### nativeArticulation
The function `nativeArticulation(keyName, articulationName)` is a function that takes two inputs, `keyName`, and `articulationName`


### flipVoices
The function `flipVoices(varFlip)` is a function that takes an input, `varFlip`

### slashNotation
The function `slashNotation(slashType)` is a function that takes an input, `slashType`

### systemBreaks
The function `systemBreaks(sysType, systemNumber)` is a function that takes two inputs, `sysType`, and `systemNumber`

### extendSlur
The function `extendSlur(esType)` is a function that takes an input, `esType`

### repeatedNotes
The function `repeatedNotes(duration, numberOfRepeats)` is a function that takes two inputs, `duration`, and `numberOfRepeats`

### selectAllSimilarElements
The function `selectAllSimilarElements()` does not take any inputs 

### defineStyleFile
The function `defineStyleFile()` does not take any inputs

### loadStyle
The function `loadStyle(styleFilePath)` is a function that takes an input, `styleFilePath`

### generateAllParts
The function `generateAllParts` does not take any inputs
