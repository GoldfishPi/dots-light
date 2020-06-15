
import XMonad
import Data.Monoid
import System.Exit

import XMonad.Util.SpawnOnce
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import Graphics.X11.ExtraTypes.XF86
import XMonad.Actions.SpawnOn

import XMonad.Util.NamedScratchpad

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Hooks.ManageHelpers (doRectFloat, doFullFloat)
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


myTerminal      = "alacritty"
myWebBrower     = "firefox"
myMusicPlayer   = "spotify"
myFileBrowser   = myTerminal ++ " -t File -e ranger $HOME "
myEmailClient   = myTerminal ++ " -t Email -e neomutt"
myEmailSetup    = myTerminal ++ " -t Email -e offlineimap"
myWeatherClient = myTerminal ++ " -t Weather -e $HOME/scripts/util/weather.sh"
myDopplerClient = "ffplay -loop 0 -window_title Doppler https://radar.weather.gov/lite/N0R/MPX_loop.gif"

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


-- Start Keybindings
------------------------------------------------------------------------
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    , ((modm,               xK_p     ), spawn "dmenu_run")
    , ((modm,               xK_space ), sendMessage (Toggle NBFULL) >> sendMessage ToggleStruts)

    , ((modm,               xK_q     ), kill)
    , ((modm,               xK_n     ), refresh)

    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp  )

    , ((modm,               xK_m     ), windows W.focusMaster  )
    , ((modm,               xK_Return), windows W.swapMaster)

    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)

    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    ------ Program Bindings ------ 
    , ((modm .|. shiftMask, xK_o     ), spawn myEmailSetup)
    , ((modm .|. shiftMask, xK_i     ), spawn myDopplerClient)
    , ((modm .|. shiftMask, xK_n     ), spawn "networkmanager_dmenu" )


    ------ Scratchpad Bindings ------ 
    , ((modm,               xK_u     ), namedScratchpadAction scratchpads "spotify")
    , ((modm .|. shiftMask, xK_u     ), namedScratchpadAction scratchpads "pavucontrol")
    , ((modm,               xK_i     ), namedScratchpadAction scratchpads "weather")
    , ((modm,               xK_y     ), namedScratchpadAction scratchpads "filemanager")
    , ((modm,               xK_o     ), namedScratchpadAction scratchpads "email")

    ------ Audio Controlls ------ 
    , ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute 0 toggle")
    , ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume 0 +5%")
    , ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume 0 -5%")
    , ((0, xF86XK_MonBrightnessUp), spawn "light -A 5")
    , ((0, xF86XK_MonBrightnessDown), spawn "light -U 5")

    , ((modm              , xK_b     ), sendMessage ToggleStruts)

    , ((modm .|. shiftMask, xK_x     ), spawn "dm-tool lock")

    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm              , xK_F2     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++

    ------ Workspace Switching ------ 
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    ------ Monitor Switching ------ 
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

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
        (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4)),

    NS "pavucontrol" "pavucontrol" (className =? "Pavucontrol")
        (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4)),

    NS "spotify" "spotify" (className =? "Spotify")
        (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4)),

    NS "weather" myWeatherClient (title =? "Weather")
        (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4)),

    NS "filemanager" myFileBrowser (title =? "File")
        (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4)),

    NS "email" myEmailClient (title =? "Email")
        (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4))
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
          className =? "firefox"        --> doShift "web"
        , className =? "Brave-browser"  --> doShift "web"
        , className =? "Slack"          --> doShift "com"
        , className =? "Ssh-askpass-fullscreen"          --> doFullFloat
        , title     =? "Ranger"         --> doRectFloat(W.RationalRect 0.15 0.15 0.7 0.7)
        , title     =? "Email"          --> doRectFloat(W.RationalRect 0.15 0.15 0.7 0.7)
        , title     =? "Weather"        --> doRectFloat(W.RationalRect 0.15 0.15 0.7 0.7)
        , title     =? "Doppler"        --> doRectFloat(W.RationalRect 0.3 0.15 0.43 0.7)
    ]

myEventHook = mempty

-- End Window Events
------------------------------------------------------------------------

myLogHook = do
    dynamicLog

myStartupHook = do
    spawnOnce "$HOME/scripts/screen/wallpaper.sh &"
    spawnOnce "picom &"

main = do 
    xmproc <- spawnPipe "xmobar -d ~/.config/xmobar/xmobarrc"
    xmonad $ docks defaults {
         logHook = dynamicLogWithPP xmobarPP {
                  ppCurrent = xmobarColor xmobarCurrentWorkspaceColor "" . wrap "[" "]"
                , ppTitle = xmobarColor xmobarTitleColor "" . shorten 50
                , ppSep = "   "
                , ppOutput = hPutStrLn xmproc
         } 
      }

defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = manageSpawn <+> myManageHook <+> namedScratchpadManageHook scratchpads,
        handleEventHook    = myEventHook,
        logHook            = dynamicLog ,
        startupHook        = myStartupHook
}

