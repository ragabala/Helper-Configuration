# User specific aliases and functions

function pyenv()
{
if [[ ( $1 == "list" ) || ( $1 == "show" ) ]]; then
	 ls ~/.venvs
	 return
fi
	if [[ ! -d ~/.venvs/$1 ]]; then
		echo "createing new Virtual Environment $1"
		python3 -m venv ~/.venvs/$1
	fi
	echo "using Virtual Environment $1"
	source ~/.venvs/$1/bin/activate
}

