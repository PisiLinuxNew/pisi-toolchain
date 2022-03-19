#!/usr/bin/python

import sys
import os

dosya=sys.argv[1]

with open(dosya) as f:
	lines = f.readlines()
for line in lines:
	i=-1
	line=line.strip()
	yol=line.split('/') 
	for parca in yol:
		i+=1
		if parca=="pspec.xml":
			paket=yol[i-1]
			print paket+" derlenecek"
	
	os.system("pisi bi -d -y --ignore-safety --ignore-sandbox "+line)
	os.system("ls *.pisi > paket.liste")
	with open("paket.liste") as f:
		dpaketler = f.readlines()
	derdurum="olumsuz"
	for dpak in dpaketler:
		if str(paket) in str(dpak):
			derdurum="tamam"
	
	if derdurum == "tamam":
		os.system("pisi-cli it *.pisi --ignore-safety --ignore-comar --ignore-dependency")
		print paket+" kuruldu"
	else:
		print paket+" derlenmesi hatali"
		break

