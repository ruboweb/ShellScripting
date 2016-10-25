#!/bin/bash
	# Config path variables
	# -------------------------

    # Video extensions
    extension=['avi','mkv','mp4','divx']


	# Torrents download dir
    dwn_dir="/media/downloads/*"

	# Series dir
    series_dir="/media/multimedia/series/"

	# Films dir
    film_dir="/media/multimedia/films/"


	# Regexp nxnn
	re="[[:digit:]]+x[[:digit:]][[:digit:]]+"


	# Script code
	# -------------------------


	# Loop by all downloaded files
        for file in $dwn_dir
        do
		f_path="${file%.*}"  # file with path and extension
		f_name="${file##*/}" # only filename
		f_ext="${file##*.}"  # only extension file

		# Loop to detect video files. Extension file in array
	 	if [[ ${extension[*]} =~ $f_ext ]]; then

			# If filename contais a serie number its a sere, ele its a film
        	        if [[ $f_path =~ $re ]]; then
                		# Serie or Doc
				serie_name=$(echo $f_name | awk 'BEGIN {FS=" - "} {print $1}') # name of serie
				mkdir -p "${series_dir}${serie_name}" # create dir if not exits
				mv -f "${file}" "${series_dir}${serie_name}" # move

			else
				# Film
				mv -f "${file}" "${film_dir}" # move
	                fi
		fi

        done

exit
