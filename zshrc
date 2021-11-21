ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'mafredri/zsh-async', from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-completions'

zplug load

for zsh_source in $HOME/.zsh/configs/*.zsh; do
  source $zsh_source
done

autoload -U promptinit; promptinit