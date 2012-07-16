import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Renamed
import XMonad.Layout.Tabbed

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myBar = "xmobar"

myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig =  defaultConfig
	{ modMask = mod4Mask
	, terminal = "urxvt"
	, layoutHook = layoutHook'
}
	

tabTheme1 = defaultTheme { decoHeight = 16
                         , activeColor = "#a6c292"
                         , activeBorderColor = "#a6c292"
                         , activeTextColor = "#000000"
                         , inactiveBorderColor = "#000000"
                         }

layoutHook' = mtile ||| tab ||| full
  where
    rt = ResizableTall 1 (2/100) (1/2) []
    mtile = renamed [Replace "M[]="] $ smartBorders $ Mirror rt
    full = renamed [Replace "[]"] $ noBorders Full 

