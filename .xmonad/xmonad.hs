{-# OPTIONS_GHC -Wno-name-shadowing #-}
module Main (main) where

--------------------------------------------------------------------------------
import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.BinarySpacePartition (emptyBSP)
import XMonad.Layout.NoBorders (noBorders)
import XMonad.Layout.ResizableTile (ResizableTall (..))
import XMonad.Layout.ToggleLayouts (ToggleLayout (..), toggleLayouts)
import XMonad.Util.EZConfig
-- import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import qualified XMonad.StackSet as W
import Control.Monad
import Data.List
import Data.Function
import XMonad.Util.NamedWindows

bar = "xmobar ~/.xmonad/xmobar.hs"

colorPrimary = "#7cb7e1"

colorSecondary = "#292f36"

barPP =
  xmobarPP
    { ppCurrent = xmobarColor colorPrimary "" . wrap "[" "]"
    }

toggleStrutsKey XConfig {XMonad.modMask = _modMask} = (_modMask, xK_b)

myTerminal = "kitty"
myBrowser = "brave-browser-nightly"

openTerminal app = myTerminal ++ " -e " ++ app

myConfig =
  ewmh $
    desktopConfig
      { modMask = mod4Mask,
        focusedBorderColor = colorPrimary,
        normalBorderColor = colorSecondary,
        manageHook = myManageHook <+> manageHook desktopConfig,
        layoutHook = desktopLayoutModifiers myLayouts,
        startupHook = do
          spawnOnce "$HOME/scripts/screen/wallpaper.sh &"
          spawnOnce "picom &"
          spawnOnce "unclutter &"
          spawnOnce "wallpaper &"
          spawnOnce "autorandr --change &",
        logHook =
          (dynamicLogString def >>= xmonadPropLog)
            <+> logHook desktopConfig <+> eventLogHookForPolyBar
      }
      `additionalKeysP` [ ("M-r", spawn "xmonad --recompile && xmonad --restart"),
                          ("M-S-x", spawn "dm-tool lock"),
                          ("M-q", kill),
                          ("M-S-<Return>", spawn myTerminal),
                          ("M-<Space>", sendMessage (Toggle "Full") <+> sendMessage ToggleStruts),
                          ("M-p", spawn "dmenu_run"),
                          -- ("M-f", spawn "systemd-run --scope -p MemoryLimit=1000M --user firefox"),
                          ("M-f", spawn myBrowser),
                          ("M-i", spawn $ openTerminal "neomutt"),
                          ("M-o", spawn "openfolder"),
                          ("M-S-o", spawn "startws"),
                          ("M-a", spawn "attachws"),
                          ("M-c", spawn "cfgfiles"),
                          ("M-S-n", spawn "networkmanager_dmenu"),
                          ("M-n", spawn $ openTerminal "newsboat"),
                          ("M-w", spawn $ openTerminal "weather"),
                          ("M-w", spawn $ openTerminal "weather"),
                          ("M-s", spawn "spotify"),
                          ("M-u", spawn "autorandr --change"),
                          ("M-g", spawn "maim -s -u | xclip -selection clipboard -t image/png -i"),
                          ("<XF86MonAudioMute>", spawn "pactl set-sink-mute 0 toggle"),
                          ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume 0 +5%"),
                          ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume 0 -5%"),
                          ("<XF86MonBrightnessUp>", spawn "light -A 1"),
                          ("<XF86MonBrightnessDown>", spawn "light -U 1")
                        ]

--------------------------------------------------------------------------------
main = do
  -- Start xmonad using the main desktop configuration with a few
  -- simple overrides:
  -- ("M-S-q", confirmPrompt myXPConfig "exit" (io exitSuccess)), -- Add some extra key bindings:
  xmonad =<< statusBar bar barPP toggleStrutsKey myConfig

--------------------------------------------------------------------------------

-- | Customize layouts.
--
-- This layout configuration uses two primary layouts, 'ResizableTall'
-- and 'BinarySpacePartition'.  You can also use the 'M-<Esc>' key
-- binding defined above to toggle between the current layout and a
-- full screen layout.
myLayouts = toggleLayouts (noBorders Full) others
  where
    others = ResizableTall 1 (1.5 / 100) (3 / 5) [] ||| emptyBSP

--------------------------------------------------------------------------------

-- | Manipulate windows as they are created.  The list given to
-- @composeOne@ is processed from top to bottom.  The first matching
-- rule wins.
--
-- Use the `xprop' tool to get the info you need for these matches.
-- For className, use the second value that xprop gives you.
myManageHook =
  composeOne
    -- Handle floating windows:
    [ transience, -- move transient windows to their parent
      isDialog -?> doCenterFloat
    ]
    <+> composeAll
      [ className =? "Pidgin" --> doFloat,
        className =? "XCalc" --> doFloat,
        className =? "mpv" --> doFloat,
        className =? "firefox" --> doShift "2",
        (className =? "Slack") --> doShift "3",
        manageDocks
      ]

eventLogHookForPolyBar = do
    winset <- gets windowset
    title <- maybe (return "") (fmap show . getName) . W.peek $ winset
    let currWs = W.currentTag winset
    let wss = map W.tag $ W.workspaces winset

    io $ appendFile "/tmp/.xmonad-title-log" (title ++ "\n")
    io $ appendFile "/tmp/.xmonad-workspace-log" (wsStr currWs wss ++ "\n")

    where
      fmt currWs ws
            | currWs == ws = "[" ++ ws ++ "]"
            | otherwise    = " " ++ ws ++ " "
      wsStr currWs wss = join $ map (fmt currWs) $ sortBy (compare `on` (!! 0)) wss
