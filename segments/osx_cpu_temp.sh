# CPU temperature for OSX

run_segment() {
# OSX Only

#set -x
#exec 2>/tmp/tmux-temp.log

if shell_is_osx; then
    if [ -f `which istats` ]; then
        CPU_TEMP=`istats cpu | cut -f3 -d" " | egrep -oe '[0-9]+' | head -1`
        if [ "$CPU_TEMP" -lt "50" ]; then
            CPU_BAR="▁ "
        elif [ "$CPU_TEMP" -ge "50" ] && [ "$CPU_TEMP" -lt "60" ]; then
            CPU_BAR="▂ "
        elif [ "$CPU_TEMP" -ge "60" ] && [ "$CPU_TEMP" -lt "68" ]; then
            CPU_BAR="▃ "
        elif [ "$CPU_TEMP" -ge "68" ] && [ "$CPU_TEMP" -lt "74" ]; then
            CPU_BAR="▅ "
        elif [ "$CPU_TEMP" -ge "74" ] && [ "$CPU_TEMP" -lt "80" ]; then
            CPU_BAR=▆⚡
        elif [ "$CPU_TEMP" -ge "80" ]; then
            CPU_BAR=▇⚡
        fi
    fi
fi

echo "${CPU_BAR}${CPU_TEMP}"

#set +x
return 0
}

