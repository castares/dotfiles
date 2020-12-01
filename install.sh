#! /bin/sh

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

echo "Creating Symbolic links to path: $SCRIPTPATH"

ZSH_PATH=$SCRIPTPATH/zsh/.zshrc
echo "ZSHRC will be linked to: $ZSH_PATH"
ln -is $ZSH_PATH $HOME/.zshrc

VIMRC_PATH=$SCRIPTPATH/vim/.vimrc
echo "VIMRC will be linked to: $VIMRC_PATH"
ln -is $VIMRC_PATH $HOME/.vimrc

TMUX_PATH=$SCRIPTPATH/tmux/.tmux.conf
echo ".tmux.conf will be linked to: $TMUX_PATH"
ln -is $TMUX_PATH $HOME/.tmux.conf

RANGER_PATH=$SCRIPTPATH/ranger/rc.conf
echo "Ranger 'rc.conf' will be linked to: $RANGER_PATH"
ln -is $RANGER_PATH $HOME/.config/ranger/rc.conf


POWERLEVEL10K_PATH=$SCRIPTPATH/powerlevel10k/.p10k.zsh

echo ".p10k.zsh will be linked to: $POWERLEVEL10K_PATH"
ln -is $POWERLEVEL10K_PATH $HOME/.p10k.zsh


