# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

# added by Anaconda3 installer
. /code/anaconda3/etc/profile.d/conda.sh

# Path to your oh-my-zsh installation.
  export ZSH=/home/transpalette/.oh-my-zsh

#export TERM=xterm-256colorize

#source /usr/share/doc/mcfly/mcfly.bash

source ~/.profile

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnosterzak"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z tmux laravel extract colorize cp web-search zsh-syntax-highlighting)

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
source $ZSH/oh-my-zsh.sh

if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

function virtualenv_info {
 [ $CONDA_PROMPT_MODIFIER ] && echo `basename $CONDA_PROMPT_MODIFIER`
}

PROMPT="%{$fg[green]%}$(virtualenv_info)%{$reset_color%}%${PROMPT}"

fpath+=('/home/transpalette/.nvm/versions/node/v10.3.0/lib/node_modules/pure-prompt/functions')

autoload -U promptinit; promptinit
prompt pure


ZSH_THEME=""

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias artisan='php artisan'
alias serve='php artisan serve'
alias tinker='php artisan tinker'
alias commit='git commit -am '
alias push='git push'
alias pull='git pull'
alias attach='tmux attach -t '
alias phpunit='vendor/phpunit/phpunit/phpunit'
alias space='df -h'
alias zshrc='vim ~/.zshrc'
alias fastboot='/opt/android-sdk/platform-tools/fastboot'
alias unlock-tethering='sysctl net.ipv4.ip_default_ttl=65'
alias tmux='TERM=xterm-256color tmux'
alias vivado='/opt/Xilinx/Vivado/2017.2/bin/vivado'
alias vivado_hls='/opt/Xilinx/Vivado_HLS/2017.2/bin/vivado_hls'
alias msp430-gcc='msp430-elf-gcc'
alias gitopullito='git pull'
alias gitocommito='git commit'
alias man='pinfo -m'
alias sml='rlwrap smlnj'
alias cat=bat
alias upgrade='trizen -Syu --noinfo --noedit --noconfirm'
alias vim=nvim
