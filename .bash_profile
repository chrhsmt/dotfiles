if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

export PATH="$HOME/.cargo/bin:$PATH"
#export PATH="/usr/local/opt/binutils/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/binutils/lib"
#export CPPFLAGS="-I/usr/local/opt/binutils/include"
