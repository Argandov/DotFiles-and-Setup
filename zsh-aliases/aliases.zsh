#!/bin/zsh
#
# DISPLAY WEATHER ON EVERY NEW SHELL SESSION:
LOCATION=$(curl -s https://ipinfo.io/json | jq .region | sed 's/ /+/g' | sed 's/\"//g') 
# prints: New+York
curl -s "wttr.in/~$LOCATION?format=%l%3A%20%c%20%C%20%t%20(%f)%20Hum%3A%20%p%20UV%3A%u"
#
#
# GCP CUSTOM CONFIG (Something went wrong and I had to do this):
export PATH=$PATH:/usr/local/bin/google-cloud-sdk
# 
#
# yazi shell wrapper:
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
# 
#
# SSH AGENT
eval "$(ssh-agent -s)"
if [ -f ~/.ssh/private_keys ]; then
    source ~/.ssh/private_keys # The file that does 'ssh-add ~/.ssh/private_key' for every SSH privKey
fi

# List all my custom aliases (alias "aliases")
alias aliases="awk '/^alias/ {print \$2}' $HOME/.config/zsh/aliases.zsh | sed 's/alias //g' |cut -d'=' -f1 | sort "
# Beeper script (Only MacOS):
alias b='$HOME/Devel/Tools/beeper/beeper.sh'

# TheFuck
eval $(thefuck --alias)

# EZA:
# alias EZA
alias l='eza --git -lD'
alias ls='eza' # standard list
alias ld='eza --git -lD' # lists only directories (no files)
alias lf='eza --git -lF --color=always | grep -v /' # lists only files (no directories)
alias lh='eza --git -dl .* --group-directories-first' # lists only hidden files (no directories)
alias ll='eza --git -al --group-directories-first' # lists everything with directories first
alias lz='eza --git -alF --color=always --sort=size | grep -v /' # lists only files sorted by size
alias lt='eza --git -al --sort=modified' # lists everything sorted by time updated
alias ltree='eza --git -TL' # Tree mode; needs a number (for depth specification)

# BAT (Batcat)
alias cat='bat -pp' # Raw output
alias catl='bat -p' # Less-like output
alias catf=bat # Fully interactive

# ZOXIDE and FZF (cat)
	# Initialize zoxide
eval "$(zoxide init --cmd cd zsh)"
	# Use RipGrep as the default fuzzy finder:
# If the folder $HOME/.config does not exist, then do X:
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --ignore-file=$HOME/.config/fzf/ignore-list -g ""'
else
	echo '[X] Please install ripgrep first (https://github.com/BurntSushi/ripgrep)'
	# Exit this program
fi
	# FZF
alias fzf='fzf --preview "bat --style=numbers --color=always --line-range :500 {}"'
	# cat
alias cdf=fzf # zoxide + fzf + bat
    # Vim Fuzzy finder
			# Explanation: Vim w/o arguments will fuzzyFind and open the selected file;
			# Else, vim works as usual
vim() {
  if [ "$#" -eq 0 ]; then
    FILE=$(fzf) && [[ -n "$FILE" ]] && command vim "$FILE"
  else
    command vim "$@"
  fi
}


# System Shortcuts
alias p="pbpaste"

# Nvim
alias v=nvim

# NEW Termbot
alias t=termbot

# OLD Termbot
#alias tldr_termbot='t -p "tldr this information"'
#alias termbot="poetry --directory $HOME/Devel/Tools/termbot/ run $HOME/Devel/Tools/termbot/termbot.py"
#alias t="poetry --directory $HOME/Devel/Tools/termbot/ run $HOME/Devel/Tools/termbot/termbot.py -s"

# Weaver
alias weaver='poetry --directory $HOME/Devel/Weaver run $HOME/Devel/Weaver/app.py'

# Toolbox
alias m='python3 $HOME/Devel/Toolbelt/Notetakers/vim-notetaker.py'
alias pdf="poetry --directory $HOME/Devel/Toolbelt/PDF-extract/ run $HOME/Devel/Toolbelt/PDF-extract/pdfextract.py"
alias scrape="poetry --directory $HOME/Devel/Toolbelt/WebScraper run $HOME/Devel/Toolbelt/WebScraper/article_scraper.py"
alias tokenize='poetry --directory $HOME/Devel/Toolbelt/GPT_Tokenizer/ run $HOME/Devel/Toolbelt/GPT_Tokenizer/tokenizer.py'
alias yt='poetry --directory $HOME/Devel/Toolbelt/YoutubeTranscript/ run $HOME/Devel/Toolbelt/YoutubeTranscript/getyt.py'
