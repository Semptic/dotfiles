function screen -a handle -d "Enables and disables the screens in the office"

    set external_screen DP-3.1
    set internal_screen DP-4

    echo $handle
    switch $handle
        case on
            xrandr --output $internal_screen --auto
            xrandr --output $external_screen --off
            xrandr --output $external_screen --auto --left-of DP-4
        case off
            xrandr --output $external_screen --off
    end
end

