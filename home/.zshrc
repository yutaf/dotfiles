# ライン操作
bindkey -e
# 自動補完を有効にする
autoload -U compinit; compinit
## cdの設定
# ディレクトリ名だけで移動する。
setopt auto_cd
# 自動でpushdする
setopt auto_pushd
# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# -------------------------------------
# 環境変数
# -------------------------------------

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# エディタ
#export EDITOR=/usr/local/bin/vim

# -------------------------------------
# プロンプト
# -------------------------------------

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
# 右プロンプトを最終行のみ出力する
#setopt transient_rprompt

autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info

# begin VCS
zstyle ":vcs_info:*" enable git svn hg bzr
zstyle ":vcs_info:*" formats "(%s)-[%b]"
zstyle ":vcs_info:*" actionformats "(%s)-[%b|%a]"
zstyle ":vcs_info:(svn|bzr):*" branchformat "%b:r%r"
zstyle ":vcs_info:bzr:*" use-simple true

zstyle ":vcs_info:*" max-exports 6

autoload -Uz is-at-least
if is-at-least 4.3.10; then
    zstyle ":vcs_info:git:*" check-for-changes true # commitしていないのをチェック
    zstyle ":vcs_info:git:*" stagedstr "+"
    zstyle ":vcs_info:git:*" unstagedstr "*"
    zstyle ":vcs_info:git:*" formats "(%b %c%u)"
    zstyle ":vcs_info:git:*" actionformats "(%s)-[%b|%a] %c%u"
fi

function vcs_prompt_info() {
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && echo -n " $vcs_info_msg_0_"
}
# end VCS

OK="^_^ "
NG="◞‸◟ "

PROMPT="
"
PROMPT+="%(?.%F{green}$OK%f.%F{red}$NG%f)"
PROMPT+="("
if [ $(uname) = "Linux" ];then
    PROMPT+="%n@%m:"
fi
PROMPT+="%~" # current directory
PROMPT+="\$(vcs_prompt_info)"
PROMPT+=")"
PROMPT+="
"

PROMPT+="%% "
