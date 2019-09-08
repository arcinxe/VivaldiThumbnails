#!/usr/bin/env bash

mkdir SVGs
mkdir PNGs
height=600
width=800
if [ $# -eq 1 ]
  then
    height=$1
    width=$(bc <<< "$1*1.33333334")
    width="${width%%.*}"
fi
echo "Output height: "$height"px"
echo "Output width:  "$width"px"

for svgFile in SVGs/*.svg; do
     pngFile="${svgFile%.svg}.png"
     pngFile="PNGs/${pngFile#SVGs/}"
     echo Input file: $svgFile
     echo "Processing..."
     
 
     inkscape -z -e "${pngFile}" -w $width -h $height "${svgFile}"
done
