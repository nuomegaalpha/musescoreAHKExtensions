# musescoreAHKExtensions

musescoreAHKExtensions is a function library that allows for easy interaction between AutoHotKey and MuseScore.  It is primarily based on the post made [here](https://musescore.org/en/node/303798) by MuseScore forum user @MichLeon.

## Functions
#### pruneStack
The function `pruneStack(posX, posY)` is a function that takes three inputs, `posX`, `posY`, and `PS_delay`, where the inputs are the X Y coordinates relative to the Prune Stack plugin of the checkbox that you want to click, and `PS_delay` is the amount of sleep time between commands in milliseconds.  It does not return a value, but gets the current mouse position, moves the mouse to `posX, posY`, and them moves the mouse back to its original position.
###### Example
For example, I map the function to the numpad, with the NumpadSub opening the plugin.

```autohotkey
    Numpad1:: ;clicks 1
    pruneStack(pruneStack_Click1_X, pruneStack_Click1_Y)
    return
```

#### insertPaletteItem