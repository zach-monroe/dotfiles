# Enable the subsequent settings only in interactive sessions
case $- in
*i*) ;;
*) return ;;
esac

# Path to your oh-my-bash installation.
export OSH='/home/z/.oh-my-bash'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="pro"

# If you set OSH_THEME to "random", you can ignore themes you don't like.
# OMB_THEME_RANDOM_IGNORED=("powerbash10k" "wanelo")

# Uncomment the following line to use case-sensitive completion.
# OMB_CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# OMB_HYPHEN_SENSITIVE="false"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

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

# Uncomment the following line if you don't want the repository to be considered dirty
# if there are untracked files.
# SCM_GIT_DISABLE_UNTRACKED_DIRTY="true"

# Uncomment the following line if you want to completely ignore the presence
# of untracked files in the repository.
# SCM_GIT_IGNORE_UNTRACKED="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.  One of the following values can
# be used to specify the timestamp format.
# * 'mm/dd/yyyy'     # mm/dd/yyyy + time
# * 'dd.mm.yyyy'     # dd.mm.yyyy + time
# * 'yyyy-mm-dd'     # yyyy-mm-dd + time
# * '[mm/dd/yyyy]'   # [mm/dd/yyyy] + [time] with colors
# * '[dd.mm.yyyy]'   # [dd.mm.yyyy] + [time] with colors
# * '[yyyy-mm-dd]'   # [yyyy-mm-dd] + [time] with colors
# If not set, the default value is 'yyyy-mm-dd'.
# HIST_STAMPS='yyyy-mm-dd'

# Uncomment the following line if you do not want OMB to overwrite the existing
# aliases by the default OMB aliases defined in lib/*.sh
# OMB_DEFAULT_ALIASES="check"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true

# To enable/disable display of Python virtualenv and condaenv
# OMB_PROMPT_SHOW_PYTHON_VENV=true  # enable
# OMB_PROMPT_SHOW_PYTHON_VENV=false # disable

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
	git
	composer
	ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
	general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	bashmarks
)

# Which plugins would you like to conditionally load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format:
#  if [ "$DISPLAY" ] || [ "$SSH" ]; then
#      plugins+=(tmux-autoattach)
#  fi

source "$OSH"/oh-my-bash.sh

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

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"

export PATH="/home/z/.local/share/bob/nvim-bin:$PATH"

export PATH=$PATH:/home/z/.spicetify
neofetch

# Created by `pipx` on 2024-05-19 03:16:15
export PATH="$PATH:/home/z/.local/bin"

#zoxide added
eval "$(zoxide init bash)"

# aliases

# Alias to make fd-find available as fd
alias fd=fdfind

# Aliases
alias nm="nodemon"
alias g="git"
alias v="NVIM_APPNAME=nvim-lazyvim command nvim"
alias lazy="NVIM_APPNAME=nvim-lazyvim command nvim"
alias vim="NVIM_APPNAME=nvim-custom command nvim"
alias vk="NVIM_APPNAME=nvim-kickstart command nvim"
alias vc="NVIM_APPNAME=nvim-custom command nvim"

# Alias for Nyoom
alias nyoom='command nvim'

# Override nvim function
function nvim() {
	NVIM_APPNAME=nvim-lazyvim command nvim "$@"
}

# vv function to select Neovim configurations with user-friendly names
vv() {
	# Define the mapping of directories to user-friendly names
	declare -A config_map=(
		["nvim"]="nyoom"
		["nvim-lazyvim"]="lazyvim"
		["nvim-custom"]="custom"
		["nvim-kickstart"]="kickstart"
	)

	# Get the list of directories
	local configs=$(fd --max-depth 1 --type d --regex 'nvim.*' ~/.config)

	# Prepare the list of user-friendly names
	local choices=()
	for config in $configs; do
		basename=$(basename "$config")
		friendly_name=${config_map[$basename]}
		if [ -n "$friendly_name" ]; then
			choices+=("$friendly_name:$basename")
		fi
	done

	# Add Nyoom to choices if it's not found in configs

	# Prompt the user to select a configuration
	local selected=$(printf "%s\n" "${choices[@]}" | cut -d: -f1 | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0)

	# If I exit fzf without selecting a config, don't open Neovim
	[[ -z $selected ]] && echo "No config selected" && return

	# Map the selected friendly name back to the directory name
	for choice in "${choices[@]}"; do
		friendly_name=$(echo $choice | cut -d: -f1)
		basename=$(echo $choice | cut -d: -f2)
		if [[ $friendly_name == $selected ]]; then
			NVIM_APPNAME=$basename
			break
		fi
	done

	# Open Neovim with the selected config
	NVIM_APPNAME=$(basename "$NVIM_APPNAME") command nvim "$@"
}
