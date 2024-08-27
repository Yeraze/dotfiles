#
function lint --description "cpplint check the current directory and all subdirectories"
  
  find . -path "./build" -prune -o \( -name \*.cc -or -name \*.h \) -print | \
      xargs ~/bin/cpplint.py
end

