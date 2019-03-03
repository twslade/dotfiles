alias pbcopy="xclip -sel clip"
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias code="GTK_IM_MODULE=ibus code"
alias output-headset="pacmd 'set-default-sink 1'"
alias output-stereo="pacmd 'set-default-sink 2'"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias dl="cd ~/Downloads"
alias sites="cd ~/sites"
alias g="git"


# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Flush Directory Service cache
alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

alias gph='git push origin HEAD'
