#!/usr/bin/env bash

function set_package_manager(){
    declare -A osInfo;
    osInfo[/etc/redhat-release]=yum
    osInfo[/etc/arch-release]=pacman
    osInfo[/etc/gentoo-release]=emerge
    osInfo[/etc/SuSE-release]=zypp
    osInfo[/etc/debian_version]=apt-get

    for f in ${!osInfo[@]}
    do
        if [[ -f $f ]];then
            PKG_MGR="sudo ${osInfo[$f]}"
        fi
    done

}


echo "setting up the environment with the configurations"
mkdir ~/.temp_helper_conf && cd ~/.temp_helper_conf
git clone https://github.com/ragabala/Helper-Configuration.git 
cd Helper-Configuration
CONF_DIR=$(pwd)
set_package_manager
echo "package manager in use : ${PKG_MGR}"

$PKG_MGR -y install tmux
$PKG_MGR -y install git
$PKG_MGR -y install vim 
$PKG_MGR -y install python3 python3-venv



echo "setting up tmux conf"
cp "${CONF_DIR}"/tmux.conf ~/.tmux.conf

echo "setting up git"
cp "${CONF_DIR}"/gitconfig ~/.gitconfig

echo "seting up vim"
cp "${CONF_DIR}"/vimrc ~/.vimrc
rm -rf ~/.vim  && mkdir -p ~/.vim && cd ~/.vim
echo " >> setting Pathogen"
git clone https://github.com/tpope/vim-pathogen.git
cp vim-pathogen/autoload ./ -rf && rm vim-pathogen -rf
echo " >> setting colors for vim"
git clone https://github.com/sjl/badwolf.git
cp badwolf/colors ./ -rf && rm badwolf -rf
echo " >> setting up nerdtree"
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
rm -rf *.markdown


echo "setting up bash"
cp "${CONF_DIR}"/bashrc  ~/.bashrc
source ~/.bashrc

rm ~/.temp_helper_conf -rf
