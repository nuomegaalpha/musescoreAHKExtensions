# musescoreAHKExtensions

musescoreAHKExtensions is a function library that allows for easy interaction between AutoHotKey and MuseScore.  It is primarily based on the post made [here](https://musescore.org/en/node/303798) by MuseScore forum user @MichLeon.

License: MIT

## Functions
#### pruneStack
The function `pruneStack(posX, posY)` is a function that takes two inputs, `posX` and `posY`, where the inputs are the X Y coordinates relative to the Prune Stack plugin of the checkbox that you want to click.  It does not return a value, but gets the current mouse position, moves the mouse to `posX, posY`, and them moves the mouse back to its original position.  The sleep time between clicks can be adjusted from within the function.

The coordinates of the checkboxes and the delay can be changed in \lib\variables.ahk file.
###### Example
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

#### insertPaletteItem
The function `insertPaletteItem(paletteCode, itemName, toolTipTime, IPE_delay)` is a function that takes four inputs, `paletteCode`, `itemName`, `IPE_toolTipTime`, and `IPE_delay`