Config { 

   -- appearance
     font =         "xft:Mononoki Nerd Font:size=10:bold:antialias=true"
   , additionalFonts = [ "xft:FontAwesome:pixelsize=13" ]
   , bgColor =      "#1f2335"
   , fgColor =      "#c3c7d2"
   , position =     Top
   , border =       BottomB
   , borderColor =  "#1f2335"

   -- layout
   , sepChar =  "%"   -- delineator between plugin names and straight text
   , alignSep = "}{"  -- separator between left-right alignment
   , template = "%battery% %StdinReader% }{ [ %dynnetwork% ] [ %memory% ] [ %date% ]"

   -- general behavior
   , lowerOnStart =     True    -- send to bottom of window stack on start
   , hideOnStart =      False   -- start with window unmapped (hidden)
   , allDesktops =      True    -- show on all desktops
   , overrideRedirect = True    -- set the Override Redirect flag (Xlib)
   , pickBroadest =     False   -- choose widest display (multi-monitor)
   , persistent =       True    -- enable/disable hiding (True = disabled)

   -- plugins
   --   Numbers can be automatically colored according to their value. xmobar
   --   decides color based on a three-tier/two-cutoff system, controlled by
   --   command options:
   --     --Low sets the low cutoff
   --     --High sets the high cutoff
   --
   --     --low sets the color below --Low cutoff
   --     --normal sets the color between --Low and --High cutoffs
   --     --High sets the color above --High cutoff
   --
   --   The --template option controls how the plugin is displayed. Text
   --   color can be set by enclosing in <fc></fc> tags. For more details
   --   see http://projects.haskell.org/xmobar/#system-monitor-plugins.
   , commands = 

        -- weather monitor
        [ Run Weather "RJTT" [ "--template", "<skyCondition> | <fc=#4682B4><tempC></fc>°C | <fc=#4682B4><rh></fc>% | <fc=#4682B4><pressure></fc>hPa"
                             ] 36000

        -- network activity monitor (dynamic interface resolution)
        , Run DynNetwork     [ "--template" , "\xf0aa <dev>: <tx>kB/s|<rx>kB/s"
                             , "--Low"      , "1000"       -- units: B/s
                             , "--High"     , "5000"       -- units: B/s
                             , "--low"      , "darkgreen"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkred"
                             ] 10

        -- cpu activity monitor
        , Run MultiCpu       [ "--template" , "Cpu: <total0>%|<total1>%"
                             , "--Low"      , "50"         -- units: %
                             , "--High"     , "85"         -- units: %
                             , "--low"      , "darkgreen"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkred"
                             ] 10

        -- cpu core temperature monitor
        , Run CoreTemp       [ "--template" , "Temp: <core0>°C|<core1>°C"
                             , "--Low"      , "70"        -- units: °C
                             , "--High"     , "80"        -- units: °C
                             , "--low"      , "darkgreen"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkred"
                             ] 50
                          
        -- memory usage monitor
        , Run Memory         [ "--template" ,"\xf233  <usedratio>%"
                             , "--Low"      , "20"        -- units: %
                             , "--High"     , "90"        -- units: %
                             , "--low"      , "darkgreen"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkred"
                             ] 10

        -- battery monitor
        , Run Battery        [ "--template" , " <acstatus>"
                             , "--Low"      , "10"        -- units: %
                             , "--High"     , "80"        -- units: %
                             , "--low"      , "#ed254e"
                             , "--normal"   , "#f9dc5c"
                             , "--high"     , "#71f79f"

                             , "--" -- battery specific options
                                       -- discharging status
                                       , "-o"	, "\xf240  <left>% (<timeleft>)"
                                       -- AC "on" status
                                       , "-O"	, "<fc=#dAA520>\xf0e7 </fc>"
                                       -- charged status
                                       , "-i"	, "<fc=#71f79f>\xf1e6 </fc>"
                             ] 50

        -- time and date indicator 
        --   (%F = y-m-d date, %a = day of week, %T = h:m:s time)
        , Run Date           "\xf133 <fc=#ABABAB> %e %B %A  \xf017 %I:%M %p</fc> " "date" 10

        -- keyboard layout indicator
        , Run Kbd            [ ("us(dvorak)" , "<fc=#00008B>DV</fc>")
                             , ("us"         , "<fc=#8B0000>US</fc>")
                             ]
        , Run StdinReader 
        ]
   }
