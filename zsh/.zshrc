export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/brauned/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#ZSH_THEME="random"
# ZSH_THEME="spaceship"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
	osx
	zsh-autosuggestions
	dotenv
    emoji-clock
    golang
    alias-tips)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# disables ! expansion
set +H

export PATH=/usr/local/bin:$PATH
export PATH=~/.local/bin:$PATH
#export =/Library/Frameworks/Python.framework/Versions/3.8/bin:$PATH
export PATH=/Users/brauned/Library/Python/3.8/bin:$PATH
#source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
export PATH=$HOME/.toolbox/bin:$PATH
alias hello='echo " hello world!"'
alias desk='ssh dev-dsk-brauned-1c-d4c0335e.eu-west-1.amazon.com'
#alias py='python3'
alias coral='cd ~/workplace/RDSDevelopment/src/RDSCoralService/'
alias bb='brazil-build'
alias bbb='brazil-build build'
alias bbr='brazil-build release'
alias brc='brazil-recursive-cmd'
alias bre='brazil-runtime-exec'
alias bwr='brazil workspace remove'
alias bws='brazil workspace show'
alias brw='brazil workspace'
alias au='mwinit -o && kinit -f'
alias ay='echo "ay ay ay" && mwinit -o && kinit -f'
alias server='python -m SimpleHTTPServer'
# My git aliases - might override the aliases from oh-my-zsh
alias grbm='git rebase mainline --ignore-date'
alias gcm='git checkout mainline'
alias qmf='qmk flash'
alias qmc='qmk compile'

alias zcd='cd $(fd --type directory | fzf)'

# mechanic alias
alias m='mechanic'

# alias python='python3'
# alias pip='pip3'
alias cat='bat -pp'

alias 11ty='npx @11ty/eleventy'
alias laws='aws rds --endpoint-url http://localhost:8000 --region us-east-1'

# alias vim='nvim'
alias ls='ls -GF'
alias ldot='ls -ld .*'
alias zshrc='vim ~/.zshrc'
alias keebs="sed -n '58,123p'  ~/keeb/qmk_firmware/keyboards/lily58/keymaps/dbrauner/keymap.c | less"

check_odin_credential() {
    curl -s "http://localhost:2009/query?Operation=CheckMaterial&ContentType=JSON&material.materialName=$1&material.materialType=Principal" \
    | tr '{},' '\n' \
    | sed -n 's/"materialName":"\(.*\)"/\1/p'
}
alias odin-check=check_odin_credential

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
#. /Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh
. /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
export PATH="/usr/local/sbin:$PATH"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

export PATH="/Applications/ARM/bin/:$PATH" 

. $HOME/.dotfiles/z/z.sh

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules}/*"'
# export PYTHONPATH=$PYTHONPATH:/usr/local/amazon/lib:/System/Library/Frameworks/Python.framework/Versions/Current/lib/
export PATH="$PATH:/Users/brauned/.local/flutter/bin"
export PATH="$HOME/.rbenv/shims:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/opt/curl-openssl/bin:$PATH"

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

# Go bin
export PATH="$HOME/go/bin:$PATH"

export MYVIMRC="$HOME/.vimrc"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# Git status for the current brazil workspace
unalias gsw
gsw() {
      last_dir=$PWD
      ws_dirs='ls ~/workspace/RDSDevelopment/src'
      for ws_dirs in $(ls ~/workplace/RDSDevelopment/src); do
              cd "$HOME/workplace/RDSDevelopment/src/${ws_dirs}"
              echo "git status -sb for ${ws_dirs}"
              gsb "${ws_dirs}"
      done
      cd ${last_dir}
}

rpg () {
    rpg-cli "$@"
    cd "$(rpg-cli pwd)"
}

export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
