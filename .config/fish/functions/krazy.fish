#
function krazy --description "krazy2 spellcheck the current directory and all subdirectories"
  find . -path "./build" -prune -o \( -name \*.cc -or -name \*.h \) -print | xargs /usr/local/Krazy2/bin/krazy2 --check spelling
end

