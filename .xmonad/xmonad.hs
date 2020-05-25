
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

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

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

--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    , ((modm,               xK_o     ), spawn "termite -e && neomutt")
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


    -- Audio Controlls
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

    -- Worspace switching
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
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

tall =
        renamed [Replace "Tall"]
        $ spacing 10
        $ limitWindows 12
        $ ResizableTall 1 (3/100) (1/2) []

layouts = tall;
myLayout =  avoidStruts $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) $ layouts

myManageHook = composeAll
    [ 
          className =? "firefox"        --> doShift "web"
        , className =? "Brave-browser"  --> doShift "web"
        , className =? "Slack"          --> doShift "com"
        , className =? "spotify"        --> doShift "web"
    ]

myEventHook = mempty

myLogHook = do
    dynamicLog

myStartupHook = do
    spawnOnce "$HOME/scripts/wallpaper.sh &"
    spawnOnce "picom"
    spawnOnce "spotify &"

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
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = dynamicLog ,
        startupHook        = myStartupHook
}

