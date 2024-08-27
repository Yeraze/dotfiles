# src
function src --description 'Go to this builds SOURCE dir'
    set -l cdir (pwd)
    while [ $cdir != "/" ]
        if [ -e $cdir/CMakeCache.txt ]
            set -l SourceDir ( cat $cdir/CMakeCache.txt | grep SOURCE_DIR | head -n 1 | cut -d '=' -f 2)
            cd $SourceDir
            break
        end
        set cdir (dirname $cdir)
    end
    echo "No CMake configuration found."
end
