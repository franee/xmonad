import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Config.Gnome
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig
import XMonad.Hooks.ManageHelpers

myManageHook = composeAll
     [ className =? "Google-chrome" --> doShift "3:franee"
     , className =? "Rhythmbox"     --> doShift "5:music"
     , className =? "Banshee"       --> doShift "5:music"
     , className =? "Vlc"           --> doShift "5:music"
     , className =? "Pidgin"        --> doShift "1:pidgin"
     , className =? "Skype"         --> doShift "2:skype"
     , className =? "Terminator"    --> doShift "7:shell1"
     , manageDocks
     , isFullscreen --> doFullFloat
     ]

main = xmonad $ gnomeConfig
        { workspaces = ["1:pidgin","2:skype","3:franee","4:caresharing","5:music","6:temp1","7:shell1","8:shell2","9:temp2"]
        , terminal   = "terminator"
        , modMask    = mod4Mask
        , layoutHook = smartBorders (layoutHook gnomeConfig)
        , manageHook = myManageHook <+> manageHook gnomeConfig
        }
        `additionalKeysP`
                 [ ("M-S-q", spawn "gnome-session-save --gui --logout-dialog")
                 , ("M-S-l", spawn "gnome-screensaver-command -l")
                 , ("M-p", spawn "kupfer")
                 ]
				  
