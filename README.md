#  Helper Configurations  

This project is a kickstarter for setting up the Linux Virtual-machine/ or
Linux distros with various tools and also adding some important shortcuts/configs.

This `Helper` configuration helps in seting up the following packages.
* Git
* Vim
* Tmux
* Bash prompts
* python virtual env

```bash
#run the following to set your system with all the configurations as stated 
git clone https://github.com/ragabala/Helper-Configuration.git
cd Helper-Configuration
chmod 777 setenv.sh
./setenv.sh
```

### Git
Contains useful additional git shortcuts.

`hist` -is useful in listing the git commits in a decorated way
`upstreamit` - fetches and rebases local with upstream/master

### Vim

It adds Pathogen, Nerdtree and `Bad wolf` color scheme for the vim editor and also adds various 
shortcuts and sets up vim configuration.

### Tmux

It adds configuration and shortcuts for using `tmux`
* C-s : used for syncronizing multiple panes

### Bash prompts

It sets the prompt so that prompt + `python environment` + `git branch` is shown in the prompt

### Python virtual env
> use `pyenv <name>` to create and use a `python venv` in the system. 
> use `pyenv list` to show all created venvs

### Thanks to

The `Helper Configuration` uses multiple open-source projects for setting up the system
* https://github.com/scrooloose/nerdtree.git
* https://github.com/sjl/badwolf.git
* https://github.com/tpope/vim-pathogen.git


Contributions are welcome.


