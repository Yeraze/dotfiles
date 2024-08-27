#tarball
function tarball -d "Create a tarball of collected files" -a filename
    echo "Creating a tarball of $filename"
    if [ -e $filename ] 
        echo "Sorry, $filename already exists."
        return
    end
    set -l args $argv[2..-1]
    set -l size (du -ck $args | tail -n 1 | cut -f 1)
    set -l extension ( echo $filename | awk -F . '{print $NF}')

    switch $extension
        case tgz
            tar cf - $args | pv -s {$size}k | gzip -c > $filename
        case tbz
            tar cf - $args | pv -s {$size}k | bzip2 -c > $filename
        case '*'
            echo "I don't know how to make a '$extension' file."
            return
    end
    set -l shrunk (du -sk $filename | cut -f 1)
    set -l ratio ( math "$shrunk * 100.0 / $size")
    echo Reduced {$size}k to {$shrunk}k \({$ratio}%\)
end
