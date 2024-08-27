# notes
function helpful
	echo 'To bulk convert all images in a directory from PNG to JPG'
	echo '   for s in  *.png ; convert $s ( basename $s .png ).jpg ; end'
	echo '.'
	echo 'To bulk rename all files into some numerical order'
	echo '   set files *.jpg'
	echo '   for s in ( seq 1 14 ); echo mv $files[$s] lens-$s.jpg; end'
end
