### TERM設定
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

### zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zaw'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug "felixr/docker-zsh-completion"
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

zplug check || zplug install
## cdr の設定 (zplug load 前に書かないと zaw-cdr がスキップされる)
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook is-at-least
if is-at-least 4.3.10; then
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':chpwd:*' recent-dirs-max 5000
    zstyle ':chpwd:*' recent-dirs-default yes
fi

zplug load

### キーバインド
bindkey -v
bindkey -a '^[[3~' delete-char
bindkey -M viins 'jj' vi-cmd-mode

### 色付けで色の名前が使えたりとか
autoload -Uz add-zsh-hook
autoload -U colors && colors

### vsc_info の設定
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' formats '(%s)[%b] '
zstyle ':vcs_info:*' actionformats '(%s)[%b|%a] '
zstyle ':vcs_info:svn:*' branchformat '%b:r%r'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

    [[ -t 1 ]] || return
    [ $EMACS ] && return
    case $TERM in
      *xterm*|rxvt|(dt|k|E)term)
      print -Pn "\e]2;localhost\a"
      ;;
    esac
}
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"
  zstyle ':vcs_info:git:*' unstagedstr "-"
  zstyle ':vcs_info:git:*' formats '(%s)[%b]%c%u'
  zstyle ':vcs_info:git:*' actionformats '(%s)[%b|%a]%c%u'
fi
function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg
zstyle ':vcs_info:bzr:*' use-simple true

### history 設定
HISTFILE=~/.zsh_historyx
HISTSIZE=100000
SAVEHIST=100000

### 補完
fpath=(~/.config/zsh/completion $fpath)
autoload -Uz compinit; compinit -Ci

### 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2
### 補完候補に色を付ける。
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
### 補完候補がなければより曖昧に候補を探す。
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' keep-prefix
zstyle ':completion:*' recent-dirs-insert both

### 補完候補
### _oldlist 前回の補完結果を再利用する。
### _complete: 補完する。
### _match: globを展開しないで候補の一覧から補完する。
### _history: ヒストリのコマンドも補完候補とする。
### _ignored: 補完候補にださないと指定したものも補完候補とする。
### _approximate: 似ている補完候補も補完候補とする。
### _prefix: カーソル以降を無視してカーソル位置までで補完する。
zstyle ':completion:*' completer _oldlist _complete _match _history _ignored _approximate _prefix
#zstyle ':completion:*' completer _complete _ignored

## 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zsh/cache
## 詳細な情報を使わない
zstyle ':completion:*' verbose no

## sudo の時にコマンドを探すパス
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

setopt no_beep  # 補完候補がないときなどにビープ音を鳴らさない。
setopt no_nomatch # git show HEAD^とかrake foo[bar]とか使いたい
setopt prompt_subst  # PROMPT内で変数展開・コマンド置換・算術演算を実行
setopt transient_rprompt  # コマンド実行後は右プロンプトを消す
setopt hist_ignore_dups   # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_all_dups  # 重複したヒストリは追加しない
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_verify
setopt share_history  # シェルのプロセスごとに履歴を共有
setopt extended_history  # 履歴ファイルに時刻を記録
#setopt hist_expand  # 補完時にヒストリを自動的に展開する。
setopt append_history  # 複数の zsh を同時に使う時など history ファイルに上書きせず追加
setopt auto_cd  # ディレクトリ名だけで移動
setopt auto_pushd  # cd したら pushd
setopt auto_list  # 補完候補が複数ある時に、一覧表示
setopt auto_menu  # 補完候補が複数あるときに自動的に一覧表示する
#setopt auto_param_slash
setopt list_packed
setopt list_types
setopt no_flow_control
setopt print_eight_bit
setopt pushd_ignore_dups
setopt rec_exact
setopt autoremoveslash
unsetopt list_beep
setopt complete_in_word  # カーソル位置で補完する。
setopt glob
setopt glob_complete  # globを展開しないで候補の一覧から補完する。
setopt extended_glob  # 拡張globを有効にする。
setopt mark_dirs   # globでパスを生成したときに、パスがディレクトリだったら最後に「/」をつける。
setopt numeric_glob_sort  # 辞書順ではなく数字順に並べる。
setopt magic_equal_subst  # コマンドライン引数の --prefix=/usr とか=以降でも補完
setopt always_last_prompt  # 無駄なスクロールを避ける

## 実行したプロセスの消費時間が3秒以上かかったら
## 自動的に消費時間の統計情報を表示する。
REPORTTIME=3

### zaw
bindkey '^[d' zaw-cdr
bindkey '^[g' zaw-git-branches
bindkey '^[@' zaw-gitdir

function zaw-src-gitdir () {
    _dir=$(git rev-parse --show-cdup 2>/dev/null)
    if [ $? -eq 0 ]
    then
        candidates=( $(git ls-files ${_dir} | perl -MFile::Basename -nle \
                                                   '$a{dirname $_}++; END{delete $a{"."}; print for sort keys %a}') )
    fi

    actions=("zaw-src-gitdir-cd")
    act_descriptions=("change directory in git repos")
}

function zaw-src-gitdir-cd () {
    BUFFER="cd $1"
    zle accept-line
}

zaw-register-src -n gitdir zaw-src-gitdir

## Aliases
alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

alias -g 'sed'='gsed'
alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sed'
alias -g C='| cat'
alias -g P='| peco'
alias -g h="history | sort -r | awk '{\$1=\"\"; print \$0}'"
alias -g ha="history -n 1 | sort -r | awk '{\$1=\"\"; print \$0}'"
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey 'hh' peco-history-selection
alias -g cdf="cd \"\$(find . -type d | peco)\""
alias -g cdl="cd \"\$(ls -d */ | peco)\""
function peco_cdr() {
    target_dir=`cdr -l | sed 's/^[^ ][^ ]*  *//' | peco`
    target_dir=`echo ${target_dir/\~/$HOME}`
    if [ -n "$target_dir" ]; then
        cd $target_dir
    fi
}
alias -g cdh="peco_cdr"
alias ls='ls -G'
alias la='ls -a'
alias vi='nvim'
function launch_workspace() {
    tmux split-window -v -c '#{pane_current_path}' &&
    tmux resize-pane -D 11 &&
    tmux new-window -c "#{pane_current_path}" &&
    tmux split-window -c "#{pane_current_path}" &&
    tmux select-pane -U &&
    tmux next-window &&
    tmux select-pane -U &&
    vi
}
alias lw='launch_workspace'

# Open google chrome from history
function ch {
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -p $HOME/Library/Application\ Support/Google/Chrome/Default/History /tmp/chrome_history

  local c=`sqlite3 -separator $sep /tmp/chrome_history \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  peco | sed 's#.*\(https*://\)#\1#'`
  if [ -n "$c" ]; then
    open -a '/Applications/Google Chrome.app' "$c"
  fi
}

# markdownをw3mで見る
ress() {
    FILENAME=$1
    if [ $# -lt 1 ]; then
        echo "Usage: $0 FILENAME"
    else
        showdown makehtml -m -i $FILENAME -o | w3m -T text/html
    fi
  }

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# PATH Rust
export PATH="$HOME/.cargo/env:$PATH"

# tmux
alias t="tmux -u"

function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

function tmux_automatically_attach_session()
{
    if is_screen_or_tmux_running; then
        ! is_exists 'tmux' && return 1

        if is_tmux_runnning; then
            echo "${fg_bold[red]} _____ __  __ _   ___  __ ${reset_color}"
            echo "${fg_bold[red]}|_   _|  \/  | | | \ \/ / ${reset_color}"
            echo "${fg_bold[red]}  | | | |\/| | | | |\  /  ${reset_color}"
            echo "${fg_bold[red]}  | | | |  | | |_| |/  \  ${reset_color}"
            echo "${fg_bold[red]}  |_| |_|  |_|\___//_/\_\ ${reset_color}"
        elif is_screen_running; then
            echo "This is on screen."
        fi
    else
        if shell_has_started_interactively && ! is_ssh_running; then
            if ! is_exists 'tmux'; then
                echo 'Error: tmux command not found' 2>&1
                return 1
            fi

            if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
                # detached session exists
                tmux list-sessions
                echo -n "Tmux: attach? (y/N/num) "
                read
                if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
                    tmux attach-session
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
                    tmux attach -t "$REPLY"
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                fi
            fi

            if is_osx && is_exists 'reattach-to-user-namespace'; then
                # on OS X force tmux's default command
                # to spawn a shell in the user's namespace
                tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
                t -u -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
            else
                t new-session && echo "tmux created new session"
            fi
        fi
    fi
}
tmux_automatically_attach_session

## tree
# alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"

# Ruby
## rbenv
# export PATH=${HOME}/.rbenv/bin:${PATH}
# eval "$(rbenv init -)"

# golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/nvim-osx64/bin:$PATH

# of
export OF_ROOT=$HOME/of
export PG_OF_ROOT=$OF_ROOT
alias projectGenerator=/Users/admin/of/projectGenerator/projectGenerator.app/Contents/MacOS/Electron

# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"

# opam
export PATH="/Applications/CoqIDE_8.8.1.app/Contents/Resources/bin:$PATH"

# nim
export PATH=/Users/admin/.nimble/bin:$PATH

# gnu-sed
export PATH="/usr/local/Cellar/gnu-sed/4.8/bin:$PATH"

# go-mod
export GO111MODULE=on

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export HTTP_PROXY=http://proxy.nintendo.co.jp:8080
export HTTPS_PROXY=$HTTP_PROXY export FTP_PROXY=$HTTP_PROXY
export NO_PROXY=localhost
export http_proxy=$HTTP_PROXY
export https_proxy=$HTTP_PROXY
export ftp_proxy=$HTTP_PROXY

# パスワード表示
password() {
    FILE=~/Documents/Accounts.yml
    cat $FILE G "PASSWORD" | sed -z 's/PASSWORD: //g' | sed -z 's/\n//g' | pbcopy
}

# MFA認証
aws_mfa() {
    if [ "${1}" = "" ]; then
        echo "Give arguments"
        return 0
    fi
    SERIAL_NUMBER=`aws iam list-mfa-devices --query "MFADevices[0].SerialNumber" --output text`
    TOKEN=`aws sts get-session-token --serial-number $SERIAL_NUMBER --token-code $1 --duration-seconds 129600`
    export AWS_ACCESS_KEY_ID=`echo $TOKEN | jq -r '.Credentials.AccessKeyId'`
    export AWS_SECRET_ACCESS_KEY=`echo $TOKEN | jq -r '.Credentials.SecretAccessKey'`
    export AWS_SESSION_TOKEN=`echo $TOKEN | jq -r '.Credentials.SessionToken'`
}

# java
# 15, 11, 1.8
JAVA_VERSION=15
export JAVA_HOME=`/usr/libexec/java_home -v "$JAVA_VERSION"`
PATH=${JAVA_HOME}/bin:${PATH}
