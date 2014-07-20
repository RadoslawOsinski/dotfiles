#!/bin/bash

#optimizes png images for size without loosing image quality in place
for i in `find ./ -name \*.png`; do
	outputFile=${i%.png}_optimized.png;
	optipng $i;
done
