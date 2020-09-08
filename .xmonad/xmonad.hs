
import XMonad
import Data.Monoid
import System.Exit

import XMonad.Util.SpawnOnce
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig (additionalKeysP)
import Graphics.X11.ExtraTypes.XF86
import XMonad.Actions.SpawnOn

import XMonad.Util.NamedScratchpad

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Hooks.ManageHelpers (doRectFloat, doFullFloat)
import XMonad.Actions.CopyWindow
    -- Layouts
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.SimplestFloat
import XMonad.Layout.OneBig
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ResizableTile
import XMonad.Layout.ZoomRow (zoomRow, zoomIn, zoomOut, zoomReset, ZoomMessage(ZoomFullToggle))
import XMonad.Layout.IM (withIM, Property(Role))

-- Layou Mods
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.Renamed(renamed, Rename(CutWordsLeft, Replace))
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), Toggle(..), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))


import qualified Data.HashTable.IO as H 

-- Local Libs
import XMonad.Hooks.Swallow


myTerminal      = "alacritty"
myWebBrower     = "firefox"
myMusicPlayer   = "spotify"
myFileBrowser   = myTerminal ++ " -t File -e ranger $HOME "
myEmailClient   = myTerminal ++ " -t Email -e $HOME/scripts/util/email.sh"
myEmailSetup    = myTerminal ++ " -t Email -e offlineimap"
myWeatherClient = myTerminal ++ " -t Weather -e $HOME/scripts/util/weather.sh"
myDopplerClient = "ffplay -loop 0 -window_title Doppler https://radar.weather.gov/lite/N0R/MPX_loop.gif"
myRssReader     = myTerminal ++ " -t Rss -e newsboat"
myEmojiSelector = "$HOME/scripts/util/emoji.sh"

clubhouseCommand = "dex $HOME/.local/share/applications/Clubhouse.desktop"


xmobarTitleColor = "#C678DD"
xmobarCurrentWorkspaceColor = "#7cb7e1"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth   = 2

myModMask       = mod4Mask

myWorkspaces    = ["dev","web","com","mus","5","6","7","8","9"]

myNormalBorderColor  = "#292f36"
myFocusedBorderColor = "#7cb7e1"
myBackgroundColor    = "#000000"
myForegroundColor    = "#ffffff"
myUrgentColor        = "#ff0000"
myCopyWindowColor    = "#00ff00"


-- Start Keybindings
------------------------------------------------------------------------
myKeys :: [(String, X ())]
myKeys =
    [ ("M-<F2>"                         , spawn "xmonad --recompile && xmonad --restart")
    , ("M-S-<Return>"                   , spawn myTerminal)
    , ("M-p"                            , spawn "dmenu_run -p Run: ")
    , ("M-S-x"                          , spawn "dm-tool lock")

    -- Window Controlls
    , ("M-q"                            , kill)
    , ("M-<Space>"                      , sendMessage (Toggle NBFULL) >> sendMessage ToggleStruts)
    , ("M-S-j"                          , windows W.swapDown)
    , ("M-S-k"                          , windows W.swapUp)
    , ("M-h"                            , sendMessage Shrink)
    , ("M-l"                            , sendMessage Expand)
    , ("M-t"                            , withFocused $ windows . W.sink)

    -- Programs
    , ("M-n"                            , spawn "networkmanager_dmenu")
    , ("M-["                            , spawn myEmojiSelector)
    , ("M-]"                            , spawn "hosts")
    , ("M-\\"                            , spawn "monitor-manager")

    -- Scratchpads
    , ("M-o"                            , namedScratchpadAction scratchpads "email")
    , ("M-S-u"                          , namedScratchpadAction scratchpads "pavucontrol")
    , ("M-i"                            , namedScratchpadAction scratchpads "weather")
    , ("M-S-i"                          , namedScratchpadAction scratchpads "doppler")
    , ("M-'"                            , namedScratchpadAction scratchpads "term")
    , ("M-b"                            , namedScratchpadAction scratchpads "clubhouse")
    , ("M-y"                            , namedScratchpadAction scratchpads "filebrowser")
    , ("M--"                            , namedScratchpadAction scratchpads "rss")

    -- Media Controlls
    , ("<XF86MonAudioMute>"             , spawn "pactl set-sink-mute 0 toggle")
    , ("<XF86AudioRaiseVolume>"      , spawn "pactl set-sink-volume 0 +5%")
    , ("<XF86AudioLowerVolume>"      , spawn "pactl set-sink-volume 0 -5%")
    , ("<XF86MonBrightnessUp>"          , spawn "light -A 5")
    , ("<XF86MonBrightnessDown>"        , spawn "light -U 5")
    ]
-- End Keybindings
------------------------------------------------------------------------

-- Start Scratchpad
------------------------------------------------------------------------
scratchpads :: [NamedScratchpad]
scratchpads = [
-- run htop in xterm, find it by title, use default floating window placement
    NS "taskwarrior" "urxvtc -name taskwarrior -e ~/bin/tw" (resource =? "taskwarrior")
        (customFloating $ W.RationalRect (2/6) (2/6) (2/6) (2/6)),

    NS "term" "alacritty -t scratchpad" (title =? "scratchpad")
        (customFloating $ W.RationalRect (1/8) (1/8) (3/4) (3/4)),

    NS "pavucontrol" "pavucontrol" (className =? "Pavucontrol")
        (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4)),

    NS "weather" myWeatherClient (title =? "Weather")
        (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4)),

    NS "filebrowser" myFileBrowser (title =? "File")
        (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4)),

    NS "email" myEmailClient (title =? "Email")
        (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4)),

    NS "rss" myRssReader (title =? "Rss")
        (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4)),

    NS "clubhouse" clubhouseCommand (resource =? "app.clubhouse.io__tickr_stories_space_7733_owned-by-me")
        (customFloating $ W.RationalRect (1/11) (1/11) (5/6) (5/6))

  ]
-- End Scratchpad
------------------------------------------------------------------------

-- Start Mouse Bindings 
------------------------------------------------------------------------
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]
-- End Keybindings
------------------------------------------------------------------------

-- Start Layout Logic
------------------------------------------------------------------------

tall =
        renamed [Replace "Tall"]
        $ spacing 10
        $ limitWindows 12
        $ ResizableTall 1 (3/100) (1/2) []

layouts = tall;
myLayout =  avoidStruts $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) $ layouts

-- End Layout Logic
------------------------------------------------------------------------

-- Start Window Events
------------------------------------------------------------------------
myManageHook = composeAll
    [ 
          className =? "firefox"                --> doShift "web"
        , className =? "Ssh-askpass-fullscreen" --> doFullFloat
        , title     =? "Ranger"                 --> doRectFloat(W.RationalRect 0.15 0.15 0.7 0.7)
        , title     =? "Email"                  --> doRectFloat(W.RationalRect 0.15 0.15 0.7 0.7)
        , title     =? "Weather"                --> doRectFloat(W.RationalRect 0.15 0.15 0.7 0.7)
        , title     =? "Doppler"                --> doRectFloat(W.RationalRect 0.3 0.15 0.43 0.7)
    ]

myEventHook = mempty

-- End Window Events
------------------------------------------------------------------------

myLogHook h = do 
    copies <- wsContainingCopies
    let check ws | ws `elem` copies =
           xmobarColor myCopyWindowColor "" $ ws
         | otherwise = xmobarColor myForegroundColor "" $ ws
    dynamicLogWithPP xmobarPP {
          ppOutput  = hPutStrLn h
        , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor "" . wrap "[" "]"
        , ppVisible = xmobarColor myForegroundColor ""
        , ppHidden  = noScratchPad
        , ppSep     =  "   "
        , ppTitle   = xmobarColor xmobarTitleColor "" . shorten 50
        , ppExtras  = []
        , ppOrder   = id
    } 
    where
        noScratchPad ws = if ws == "NSP" then "" else ws

myStartupHook = do
    spawnOnce "$HOME/scripts/screen/wallpaper.sh &"
    spawnOnce "picom &"
    spawnOnce "dunst &"

main = do 
    xmproc <- spawnPipe "xmobar -d $HOME/.xmonad/xmobar.hs"
    pidHashTable <- H.new :: IO(H.BasicHashTable Int Window)
    windowHashTable <- H.new :: IO(H.BasicHashTable Window Int)
    xmonad $ ewmh $ docks def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = manageSpawn <+> myManageHook <+> namedScratchpadManageHook scratchpads,
        handleEventHook    = swallowEventHook pidHashTable windowHashTable <+> myEventHook <+> fullscreenEventHook,
        logHook            = myLogHook xmproc <+> dynamicLog ,
        startupHook        = myStartupHook
    } `additionalKeysP` myKeys 

