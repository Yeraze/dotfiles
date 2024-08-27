#expand
function expand -d 'Decompress a file' -a filename
    set -l extension ( echo $filename | awk -F . '{print $NF}')
    switch $extension
        case tar
            echo "Un-tar-ing $filename..."
            pv $filename | tar xf -
        case tgz
            echo "Un-tar/gz-ing $filename..."
            pv $filename | tar zxf -
        case tbz
            echo "Un-tar/bz-ing $filename..."
            pv $filename | tar jxf -
        case gz
            echo "Un-gz-ing $filename..."
            pv $filename | gunzip -
        case bz
            echo "Un-bz-ing $filename..."
            pv $filename | bunzip2 -
        case bz2
            echo "Un-bz-ing $filename..."
            pv $filename | bunzip2 -
        case zip
            echo "Un-zipping $filename..."
            unzip $filename 
        case '*'
            echo I don\'t know what to do with $extension files.
    end
end
