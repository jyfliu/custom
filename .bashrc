# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

export VISUAL=vim
export EDITOR="$VISUAL"

alias g++='g++ --std=c++17 -g -Werror'
alias 'clang++'='clang++ --std=c++17 -g -Werror'
alias make='make -j8'

# prefer clang over gcc (and assume its installed)
# TODO add a check to see if clang is installed first?
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

alias callgrind='valgrind --tool=callgrind'

