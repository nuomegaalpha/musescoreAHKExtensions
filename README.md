# musescoreAHKExtensions

musescoreAHKExtensions is a function (soon to be class) library that allows for easy interaction between AutoHotKey and MuseScore.  It is primarily based on the post made [here](https://musescore.org/en/node/303798) by MuseScore forum user @MichLeon.

License: MIT

Copyright (c) 2021 Noah McAllister

## Note (as of Jan 30 2021)
I am currently building classes to incorporate the functions that MichLeon wrote in this post.  All of the new stuff is in the v2 folder; everything besides that should work. 

## About
At the heart of these functions is `insertPaletteItem()`, which allows you to insert any palette item (such as dynamics, lines, arpeggios, etc.) through a macro. It does this through the ingenious method created [here](https://musescore.org/en/node/303798) by @MichLeon by renaming every palette item with a unique identifier, and then seaching the palette for the unique identifier.

The other functions are functions that I used on a daily basis.

In the Example Scripts Section, I have included my main AHK script.  Feel free to download this, use mine, build your own scripts, or do a combination of both!

The INI files \lib\paletteList.ini and \lib\paletteDefintions.ini contain every single palette item as a key-value pair. The key in both of these files is the shortcut as defined in \lib\infoShortcuts.ahk. In \lib\paletteList.ini, the value is unique idenitifier of the palette item (all of the palette items in ahk workspace v3.workspace have been renamed). In \lib\paletteDefintions.ini, the value is tooltip that will be displayed when the function `insertPaletteItem()` is called.

## Installation
1. Install [AutoHotKey](https://www.autohotkey.com/) if you do not have it already. If you have not used AutoHotKey, it is recommended that you read [this](https://www.autohotkey.com/docs/Tutorial.htm) tutorial before you download this library.
2. Download this repository and place it in your usual AutoHotKey folder.
3. Move ahk workspace v3.workspace to C:\Program Files\MuseScore 3\workspaces. This is the same workspace as on @MichLeon's post, but I have added more palette items (mostly textual items that I use a lot).
4. Restart MuseScore. When you reopen it, choose the ahk workspace v3 workspace (on the dropdown box that says "Basic" or "Advanced").
5. If you do not want to build a script yourself, run musescoreMain.ahk. It contains all of the function included. Jump to the Example script section to read more about using it.
6. If you are building a script yourself, just add `#Include <lib>` at the top of your script to include the functions, variables, info message boxes, and INI files.

## Example Scripts
### musescoreMain.ahk

This script contains all of the functions, and its input box system is similar to MichLeon's. A few notes about how to use it:

#### Input Box
- The way to access any palette item or function is through typing into the input box. By default, the shortcut to trigger the input box is Z+A. If you wish to keep this as your shortcut, clear the shortcut to open the Symbols Palette (which is by default Z) in Edit>Preferences>Shortcuts.
- If you want change the shortcut to open the input box, change it in line 74.
- Make sure that the Palette Search shortcut is Ctrl+F9 in MuseScore
- Make sure that Apply Palette Item to Score shortcut is Ctrl+Alt+P in MuseScore
- To learn what the shortcuts for palette items are, type "?".  This will bring up a box where you can then type ? followed by a letter for item specific shortcuts.
- `generateAllParts()` is called by typing "parts".  Change its input to your shortcut to open the parts dialog.
- `systemBreaks()` is called by typing "break.[integer]" to add system breaks every [integer] measures, or "break.remove" to remove system breaks.
- `repeatedNotes()` is called by typing "rhy.[duration].[numberOfRepeats]". Read more about it in the functions section.
- `loadStyle()` and `defineStyleFile()` are called through by typing "style.new" for `loadStyle()` or "style" for `defineStyleFile()`.

#### Select All Similar Elements
- `selectAllSimilarElements()` is called through Ctrl+RightClick. A selection must be made first for it to work

#### Prune Stack
- NumpadSub opens the [Prune Stack](https://musescore.org/en/project/prunestack) plugin. Change line 21 to whatever you have assigned as the hotkey to open the plugin.
- The Numpad1 through Numpad8 numbers click the checkboxes; Numpad0 clicks close, and NumpadEnter clicks enter.
- You need to use Window Spy (right click on any running AHK script) to find the position the checkboxes on your monitor. Change these values in \lib\variables.ahk.

## Functions
### pruneStack
The function `pruneStack(posX, posY)` is a function that takes two inputs, `posX` and `posY`, where the inputs are the X Y coordinates relative to the Prune Stack plugin of the checkbox that you want to click.  It does not return a value, but gets the current mouse position, moves the mouse to `posX, posY`, and them moves the mouse back to its original position.  The sleep time between clicks can be adjusted from within the function.

The coordinates of the checkboxes and the delay can be changed in \lib\variables.ahk file.

#### Example
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

NumpadEnter:: ;clicks enter
pruneStack(pruneStack_ClickEnter_X, pruneStack_ClickEnter_Y)
WinActivate, ahk_exe MuseScore3.exe
MouseMove, PSInitX, PSInitY
return

Numpad0:: ;clicks close
pruneStack(pruneStack_ClickClose_X, pruneStack_ClickClose_Y)
WinActivate, ahk_exe MuseScore3.exe
MouseMove, PSInitX, PSInitY
return
```

### insertPaletteItem
The function `insertPaletteItem(paletteCode, itemName, toolTipTime, IPE_delay)` is a function that takes four inputs, `paletteCode`, `itemName`, `IPE_toolTipTime`, and `IPE_delay`. `paletteCode` is the unique identifier for the palette item; it is also the value (right of the equals sign) in \lib\paletteList.ini. `itemName` is the name of the palette item that will be displayed as a tooltip; it is also the value of \lib\paletteDefinitions.ini. `IPE_toolTipTime` is the length of time (in milliseconds) the tooltip will be displayed for. `IPE_delay` is the amount of sleep time (in milliseconds) between commands to be executed.

The purpose of this function is to add any palette item to the score. In my script (and @MichLeon's original script), on a hotkey, an input box is generated where the user can type in something, and upon hitting enter, the script will search for what the user typed, send the correct palette code, then send the hotkey to "Add Current Palette Item to Score".

>This script works by using Ctrl+F9 to "Search Palette" and Ctrl+Alt+P to "Add Current Palette Item to Score". These can be changed to whatever hotkey you have them defined as in MuseScore.

#### Example
I use this function in conjuction with an INI search of \lib\paletteDefinitions.ini and \lib\paletteList.ini to search for a user entered value `PaletteSymbol`.  This is much quicker and less intensive than having conditional statements for each palette item.

``` autohotkey
IniRead, sendToPalette, %A_ScriptDir%\lib\paletteList.ini, section1, %PaletteSymbol%
IniRead, paletteItemDefintion, %A_ScriptDir%\lib\paletteDefintions.ini, section1,%PaletteSymbol%
insertPaletteItem(sendToPalette, paletteItemDefintion, 1200, 50)
```

### nativeArticulation
The function `nativeArticulation(keyName, articulationName)` is a function that takes two inputs, `keyName`, and `articulationName`. `keyName` is the standard MuseScore hotkey for the articulation:

`articulationName` | Default Hotkey | `keyName` 
-- | -- | -- 
Staccato | Shift + S | `S` 
Marcato | Shift + O | `O`
Accent | Shift + V | `V`
Tenuto | Shift + N | `N`

`articulationName` is the name of the articulation; it will also be displayed as a tooltip.

Use case: I only use this function when using a second keyboard as a dedicated macro keyboard. It has little purpose other than that specific use case. 

#### Example
``` autohotkey
q::
nativeArticulation("s", "Staccato")		;staccato articulation
return
```

### flipVoices
The function `flipVoices(varFlip)` is a function that takes an input, `varFlip` which can be defined as follow: 

`varFlip` | Purpose
-- | --
1-2 | Flips voice 1 and 2.
1-3 | Flips voice 1 and 3.
1-4 | Flips voice 1 and 4.
2-3 | Flips voice 2 and 3.
2-4 | Flips voice 2 and 4.
3-4 | Flips voice 3 and 4.

The function works by using Alt to get access to the Tool menu.

#### Example
In this example, a user input (`PaletteSymbol`) of the type `flip.[varFlip]` is parsed (quotation marks are removed if `varFlip` had them), and the function is called. 
``` autohotkey
Else If PaletteSymbol Contains flip
{
    flipArray := StrSplit(PaletteSymbol, ".", " `t")
    global varFlip := flipArray[2]
    StringReplace, varFlip, varFlip, ", , All
    flipVoices(varFlip)
    return
}
```

### slashNotation
The function `slashNotation(slashType)` is a function that takes an input, `slashType` which can be defined as follow: 

`slashType` | Purpose
-- | --
area | Fills a selected region with slashes.
rhythm OR rhy | Changes all noteheads in a selected region to rhythm slashes.

The function works by using Alt to get access to the Tool menu.

#### Example
In this example, a user input (`PaletteSymbol`) of the type `slash.[slashType]` is parsed, and the function is called.
``` autohotkey
Else If PaletteSymbol Contains slash
{
    slashArray := StrSplit(PaletteSymbol, ".", " `t")
    global slashType := slashArray[2]
    slashNotation(slashType)
    return
}
```


### systemBreaks
The function `systemBreaks(sysType, systemNumber)` is a function that that takes two inputs, `sysType`, and `systemNumber`. It calls the dialog box "Add/Remove System Breaks" and navigates through that. `sysType` can be "add" or "remove"; if it is "add", `systemNumber` is the number of measure you want per system.

#### Example
In this example, a user input (`PaletteSymbol`) of the type `break.[systemNumber]` is parsed, and the function is called.
``` autohotkey
Else If PaletteSymbol Contains break
{
    sysBreakArray := StrSplit(PaletteSymbol, ".", " `t")
    global breakNumber := sysBreakArray[2]
    if (breakNumber = "remove") {
        systemBreaks("remove", "")
        return
    }

    else {
        systemBreaks("add", breakNumber)
        return
    }
}
```


### extendSlur
The function `extendSlur(esType)` is a function that takes an input, `esType`, which can either be "forward" or "backward".  It will extend the slur left or right depending on what `esType` is.

Use case: I only use this function when using a second keyboard as a dedicated macro keyboard. It has little purpose other than that specific use case.

#### Example
``` autohotkey
a::
extendSlur("forward")
return

+a::
extendSlur("backwards")
return
```


### repeatedNotes
The function `repeatedNotes(duration, numberOfRepeats, RN_hotkey)` is a function that takes three inputs, `duration`, `numberOfRepeats`, and `RN_hotkey`.  The function will create a specified number of notes (`numberOfRepeats`) of specified duration (`duration`) in rhythm entry mode.  `RN_hotkey` is the hotkey that you decide starts "Rhythm Entry Mode".

Duration | `duration`
-- | --
16th Note | `16` or `s`
8th Note | `8` or `e`
Quarter Note | `4` or `q`
Half Note | `2` or `h`
Whole Note | `1` or `w`

This is extremely powerful for filling an entire section with the same duration to be re-pitched.

#### Example
In this example, a user input (`PaletteSymbol`) of the type `rhy.[duration].[numberOfRepeats]` is parsed, and the function is called.
``` autohotkey
Else If PaletteSymbol Contains rhy
{
    rhyPatternArray := StrSplit(PaletteSymbol, ".", " `t")
    global duration := rhyPatternArray[2]
    global numberOfRepeats := rhyPatternArray[3]
    repeatedNotes(duration, numberOfRepeats, "^+i")
    return
}
```


### selectAllSimilarElements
The function `selectAllSimilarElements()` right clicks on a user-selection and navigates through to the contexual menu to select "Select All Similar Elements in Range Selection". It is more stable than using the shortcut built into MuseScore; this is my most frequently used function.

#### Example
I assign this function to Ctrl+RightClick
``` autohotkey
~^RButton::			; selects all similar elements in range selection
selectAllSimilarElements()
return
```

### defineStyleFile
The function `defineStyleFile(root)` takes the input `root` which is the path to your \MuseScore 3\Styles file.  It returns the `stylePath`, the path to that style file. 

#### Example
This example works in conjunction with the next function; it is used when you need to set the same style of a lot of parts/scores.

In this example, a user input (`PaletteSymbol`) of the type `sty[le].[new]` is parsed, and the function is called.
``` autohotkey
Else If PaletteSymbol Contains sty
{
    styleArray := StrSplit(PaletteSymbol, ".", " `t")
    styleFunctionType := styleArray[2]
    if (styleFunctionType = "new") {
        global path := defineStyleFile("C:\Users\noahm\Documents\MuseScore3\Styles")
        MsgBox, % "The style file you selected is" . path
        return
    }
    else {
        loadStyle(path)
        return
    }
}
```

### loadStyle
The function `loadStyle(styleFilePath)` is a function that takes an input, `styleFilePath` and load the `styleFilePath` as the style of the score.

#### Example
This example works in conjunction with the previous function; it is used when you need to set the same style of a lot of parts/scores. First, you select the style file you want to mass apply, and then you can run `loadStyle(styleFilePath)` to apply it ad nauseum.

In this example, a user input (`PaletteSymbol`) of the type `sty[le].[new]` is parsed, and the function is called.
``` autohotkey
Else If PaletteSymbol Contains sty
{
    styleArray := StrSplit(PaletteSymbol, ".", " `t")
    styleFunctionType := styleArray[2]
    if (styleFunctionType = "new") {
        global path := defineStyleFile("C:\Users\noahm\Documents\MuseScore3\Styles")
        MsgBox, % "The style file you selected is" . path
        return
    }
    else {
        loadStyle(path)
        return
    }
}
```

### generateAllParts
The function `generateAllParts` does not take an inputs; it generates new parts for each instrument in the score. 

#### Example
In this example, a user input (`PaletteSymbol`) of the type `parts` is parsed, and the function is called.
``` autohotkey
Else If (PaletteSymbol = "parts") {
    generateAllParts("^+!p")
    return
}
```

## Upcoming

- [ ] finish newPaletteItem() function
- [ ] include file manipulation functions