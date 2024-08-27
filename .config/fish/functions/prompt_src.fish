# src
function prompt_src --description 'Find details on this builds SOURCE dir' -v PWD
    set -l cdir (pwd)
    while [ $cdir != "/" ]
        if [ -e $cdir/CMakeCache.txt ]
            set -l SourceDir ( cat $cdir/CMakeCache.txt | grep SOURCE_DIR | head -n 1 | cut -d '=' -f 2)
            if [ -d $SourceDir/.git ]
                set -l gitinfo (git --git-dir=$SourceDir/.git --work-tree=$SourceDir status -sb --untracked-files=no)
                set -l branch ( echo $gitinfo[1] | cut -b 4- )
                set -l branch_color (set_color red)\[M\]
                if test (count $gitinfo) -eq 1 
                    set branch_color (set_color green)
                end

                set -g CURRENT_SOURCE \* Builds (set_color green)$SourceDir $branch_color \($branch\) (set_color normal)
                return
            else
                set -g CURRENT_SOURCE \* Builds (set_color yellow)$SourceDir (set_color normal)
                return
            end
        end
        set cdir (dirname $cdir)
    end
    set -e CURRENT_SOURCE 
end
