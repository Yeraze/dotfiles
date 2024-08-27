# xeno_list
function xeno_list --description 'Colored xeno list results'
    for s in  ( xeno-list ); 
        set -l xen_id (echo $s | cut -d ':' -f 1)
        set -l xen_desc (echo $s | cut -d ':' -f 2-)

        set -l xen_array (echo $s | tr ' ' \n)
        set -l statuscolor (set_color green)
        set -l desccolor (set_color normal)
        if test $xen_array[-1] = "unsynced" 
            set statuscolor (set_color red)
            set desccolor (set_color yellow)
        end

        echo $statuscolor\[$xen_id\] $desccolor $xen_desc (set_color normal)
    end
end
