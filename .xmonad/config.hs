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
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

bar = "xmobar"

colorPrimary = "#7cb7e1"

colorSecondary = "#292f36"

barPP =
  xmobarPP
    { ppCurrent = xmobarColor colorPrimary "" . wrap "[" "]"
    }

toggleStrutsKey XConfig {XMonad.modMask = _modMask} = (_modMask, xK_b)

myTerminal = "alacritty"

myConfig =
  ewmh $
    desktopConfig
      { modMask = mod4Mask,
        focusedBorderColor = colorPrimary,
        normalBorderColor = colorSecondary,
        manageHook = myManageHook <+> manageHook desktopConfig,
        layoutHook = desktopLayoutModifiers myLayouts,
        handleEventHook = fullscreenEventHook,
        startupHook = do
          spawnOnce "$HOME/scripts/screen/wallpaper.sh &"
          spawnOnce "picom &"
          spawnOnce "unclutter &"
          spawnOnce "autorandr --change &",
        logHook =
          (dynamicLogString def >>= xmonadPropLog)
            <+> logHook desktopConfig
      }
      `additionalKeysP` [ ("M-r", spawn "xmonad --recompile && xmonad --restart"),
                          ("M-S-x", spawn "dm-tool lock"),
                          ("M-q", kill),
                          ("M-S-<Return>", spawn "alacritty"),
                          ("M-<Space>", sendMessage (Toggle "Full") <+> sendMessage ToggleStruts),
                          ("M-p", spawn "dmenu_run"),
                          ("M-f", spawn "firefox"),
                          ("M-i", spawn (myTerminal ++ " -e neomutt")),
                          ("M-o", spawn "openfolder"),
                          ("M-S-o", spawn "startws"),
                          ("M-a", spawn "attachws"),
                          ("M-c", spawn "cfgfiles"),
                          ("M-S-n", spawn "networkmanager_dmenu"),
                          ("M-n", spawn (myTerminal ++ " -e newsboat")),
                          ("M-s", spawn "spotify"),
                          ("M-u", spawn "autorandr --change"),
                          ("<XF86MonAudioMute>", spawn "pactl set-sink-mute 0 toggle"),
                          ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume 0 +5%"),
                          ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume 0 -5%"),
                          ("<XF86MonBrightnessUp>", spawn "light -A 1"),
                          ("<XF86MonBrightnessDown>", spawn "light -U 1")
                        ]

--------------------------------------------------------------------------------
main = do
  _ <- spawnPipe "xmobar -d $HOME/.xmonad/xmobar.hs"

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
        className =? "mpv" --> doFloat
      ]
