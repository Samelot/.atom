# All functions defined on "this" are available as atom commands.
#
# If the `toolbar` package is installed, toolbar icons are automatically generated.
#
# Set these properties of your function to configure the icons:
# * icon - name of the icon (Or a method returning the icon name, possibly prepended with 'ion-' or 'fa-')
# * title - The toolbar title (or a method returning the title)
# * hideIcon - set to true to hide the icon from the toolbar
#

@helloConsole = ->
    console.log 'Hello console'
    alert('Watch your console! (open with alt-cmd-i)')

@helloConsole.icon = 'ion-clipboard' # icon from https://atom.io/packages/toolbar#supported-icon-sets
@helloConsole.title = 'Hello Console!'

# Every property on "this" which is not a function triggers a separator
@sp1 = "----------------"

# Call other atom commands (see https://gist.github.com/jcouyang/10816025)

@['Save All'] = ->
    dispatchWorkspaceCommand 'window:save-all'
@['Save All'].icon = 'fa-save'


# You can also call external commands:

@runShellCommand = ->
    child = exec 'ls', (error, stdout, stderr) ->
        console.log "stdout: #{stdout}"
        console.log "stderr: #{stderr}"
    if error?
        console.log "exec error: #{error}"

@runShellCommand.icon = 'fa-pied-piper-alt'


@openBrowser = ->
    open 'https://atom.io/packages/atom-macros'

    # The toolbar button is updated after the method execution
    # so you can change its properties:
    @title = 'Do it again!'
    @icon = 'ion-thumbsup'


@openBrowser.icon = 'ion-earth'

# Give the next separator another name
@sp2 = "----------------"

@openThisFile = ->
    dispatchWorkspaceCommand 'macros:edit-macros'

@openThisFile.title = 'Edit Macros'


# Some event handlers are also provided:

@onLoad = ->
    undefined # called, when the macros have been loaded, i.e. when Atom started

@onUnload = ->
    undefined # called, when the macros have been unloaded, i.e. when Atom stopped
###
@samup = ->
    e = atom.workspace.getActiveTextEditor()
    cursorColumn = e.getCursorBufferPosition().column

    # for cursor in e.getCursors()
    #   cursor.moveLeft() unless cursor.isAtBeginningOfLine()

    bufferPosition = e.getCursorBufferPosition()
    line = e.lineTextForBufferRow(bufferPosition.row)
    firstCharacterColumn = line.search(/\S/)

    console.log(cursorColumn)
    console.log(firstCharacterColumn)

    if cursorColumn ==  firstCharacterColumn
    dispatchEditorCommand 'core:move-up'
    dispatchEditorCommand 'editor:move-to-first-character-of-line'

    # if firstCharacterColumn is -1
    #   false
    #   console.log("bog")
    # else
    #   bufferPosition.column > firstCharacterColumn
    #   console.log("yeaa")

    # dispatchEditorCommand 'core:move-up'
    # dispatchEditorCommand 'editor:move-to-end-of-screen-line'
###

@coronaSimulatorKill = ->
    dispatchWorkspaceCommand 'process-palette:kill-and-remove-focused-process'
    dispatchWorkspaceCommand 'process-palette:hide'

@areMacrosWorking = ->
    dispatchEditorCommand 'core:move-up'
