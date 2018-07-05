#!/usr/bash
# NameCardGenerator.sh
# Using GMT to layout a identification card/ Group ID
# Author: Sun, ChengWei (r05224123 {at} ntu.edu.tw)
# Originally announced on Github
# 
# Code lisence : Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) 
# https://creativecommons.org/licenses/by-sa/4.0/
ps=NameCard.ps

# NumtoIMPath : map the group ID to image path
function NumtoIMPath {
	#Image Source
	P1=./Images/N1.jpg
	P2=./Images/N2.jpg
	P3=./Images/N3.jpg
	P4=./Images/N4.jpg
	P5=./Images/N5.jpg
	P6=./Images/N6.jpg
	P7=./Images/N7.jpg
	P8=./Images/N8.jpg
	P9=./Images/N9.jpg

	case "$1" in 
		"1") echo ${P1} ;;
		"2") echo ${P2} ;;
		"3") echo ${P3} ;;
		"4") echo ${P4} ;;
		"5") echo ${P5} ;;
		"6") echo ${P6} ;;
		"7") echo ${P7} ;;
		"8") echo ${P8} ;;
		"9") echo ${P9} ;;
		"0") echo 0;;
	esac
}

# Draw : Generate a single ID card page.
function Draw {
echo "====== Start ======"
# Variable from command line
local Atl="${1}"
local Atr="${2}"
local Abl="${3}"
local Abr="${4}"
local Btl="${5}"
local Btr="${6}"
local Bbl="${7}"
local Bbr="${8}"
local Ctl="${9}"
local Ctr="${10}"
local Cbl="${11}"
local Cbr="${12}"
local Dtl="${13}"
local Dtr="${14}"
local Dbl="${15}"
local Dbr="${16}"
local ps="${17}"

echo "${ps}"

# Change imageID to path
Atl=`NumtoIMPath ${Atl}`
Atr=`NumtoIMPath ${Atr}`
Abl=`NumtoIMPath ${Abl}`
#Abr=`NumtoIMPath ${Abr}`
Btl=`NumtoIMPath ${Btl}`
Btr=`NumtoIMPath ${Btr}`
Bbl=`NumtoIMPath ${Bbl}`
#Bbr=`NumtoIMPath ${Bbr}`
Ctl=`NumtoIMPath ${Ctl}`
Ctr=`NumtoIMPath ${Ctr}`
Cbl=`NumtoIMPath ${Cbl}`
#Cbr=`NumtoIMPath ${Cbr}`
Dtl=`NumtoIMPath ${Dtl}`
Dtr=`NumtoIMPath ${Dtr}`
Dbl=`NumtoIMPath ${Dbl}`
#Dbr=`NumtoIMPath ${Dbr}`

# Start GMT commands
## Header
gmt psxy -R0/20/0/28 -Jx.95c -K -P -X1c -Y1c << ! > ${ps}
!
# Top Left (A)
echo "===== A ====="
gmt psimage -J -R ${Atl} -Dg2.5/24.5+r600+w4.75/6.75+jMC -P -O -K >> ${ps}
gmt psimage -J -R ${Atr} -Dg7.5/24.5+r600+w4.75/6.75+jMC -P -O -K >> ${ps}
gmt psimage -J -R ${Abl} -Dg2.5/17.5+r600+w4.75/6.75+jMC -P -O -K >> ${ps}
if `echo "${Abr}" | grep -q "[bBrRtT]*"` ; then
gmt pstext -J -R -F+jBC+f14p,Helvetica,black -P -O -K << EOF >> ${ps}
7.5 14.5 ${Abr}
EOF
elif [ ["${Abr}" -ne "0"] ]; then
gmt psimage -J -R ${Abr} -Dg7.5/17.5+r300+w4.75/6.75+jMC -P -O -K >> ${ps}

fi

# Top Right (B)
echo "===== B ====="
if [[ "${Btl}" != "0" ]]; then
gmt psimage -J -R ${Btl} -Dg12.5/24.5+r300+w4.75/6.75+jMC -P -O -K >> ${ps}
gmt psimage -J -R ${Btr} -Dg17.5/24.5+r300+w4.75/6.75+jMC -P -O -K >> ${ps}
gmt psimage -J -R ${Bbl} -Dg12.5/17.5+r300+w4.75/6.75+jMC -P -O -K >> ${ps}
if `echo "${Bbr}" | grep -q "[bBrRtT]*" ` ; then
gmt pstext -J -R -F+jBC+f14p,Helvetica,black -P -O -K << EOF >> ${ps}
17.5 14.5 ${Bbr}
EOF
elif [[ "${Bbr}" != "0" ]]; then
gmt psimage -J -R ${Bbr} -Dg17.5/17.5+r300+w4.75/6.75+jMC -P -O -K >> ${ps}
fi
fi

# Bottom Left (C)
echo "===== C ====="
if [[ "${Ctl}" != "0" ]]; then
gmt psimage -J -R ${Ctl} -Dg2.5/10.5+r300+w4.75/6.75+jMC -P -O -K >> ${ps}
gmt psimage -J -R ${Ctr} -Dg7.5/10.5+r300+w4.75/6.75+jMC -P -O -K >> ${ps}
gmt psimage -J -R ${Cbl} -Dg2.5/3.5+r300+w4.75/6.75+jMC -P -O -K >> ${ps}
if `echo "${Cbr}" | grep -q "[bBrRtT]*" ` ; then
gmt pstext -J -R -F+jBC+f14p,Helvetica,black -P -O -K << EOF >> ${ps}
7.5 0.5 ${Cbr}
EOF
elif [[ "${Cbr}" != "0" ]]; then
gmt psimage -J -R ${Cbr} -Dg7.5/3.5+r300+w4.75/6.75+jMC -P -O -K >> ${ps}
fi
fi

# Bottom Right (D)
echo "===== D ====="
if [[ "${Dtl}" != "0" ]]; then
gmt psimage -J -R ${Dtl} -Dg12.5/10.5+r300+w4.75/6.75+jMC -P -O -K >> ${ps}
gmt psimage -J -R ${Dtr} -Dg17.5/10.5+r300+w4.75/6.75+jMC -P -O -K >> ${ps}
gmt psimage -J -R ${Dbl} -Dg12.5/3.5+r300+w4.75/6.75+jMC -P -O -K >> ${ps}

if $( echo "${Dbr}" | grep -q "[bBrRtT]*" ) ; then
gmt pstext -J -R -F+jBC+f14p,Helvetica,black -P -O -K << EOF >> ${ps}
17.5 0.5 ${Dbr}
EOF

elif [[ "${Dbr}" != "0" ]]; then
gmt psimage -J -R ${Dbr} -Dg17.5/3.5+r300+w4.75/6.75+jMC -P -O -K >> ${ps}
fi
fi

# Closure
gmt psxy -R -J -O -P <<!>> ${ps}
!
gmt psconvert ${ps} -Tj -E300
gmt psconvert ${ps} -Tf -E600
}

# Main Script starts here.
# Extract data from CSV file preparing for the Draw function 
awk 'BEGIN {
	FS="," ;
	N=0 ;
	ORS=" ";
	outf = ("div" N) ;
}
NR>1 {
	if (((NR-1) % 4) == 1){
		printf "\n"  >> outf ;
		N=(N)+1 ;
		outf = ("div" N) ;	
	}
	print outf
	printf "%s %s %s %s ",$6,$7,$8,$4  > outf ;
}
END {
	if((NR-1) % 4 == 1){
		printf "0 0 0 0 0 0 0 0 0 0 0 0" >> outf ;
	}
	else if ((NR-1) % 4 == 2){
		printf "0 0 0 0 0 0 0 0" >> outf ;
	}
	else if ((NR-1) % 4 == 3){
		printf "0 0 0 0" >> outf ;
	}
}' ${1}
rm div0

# Generate the pages
fcount=1
psbasename="Page"
fname="${psbasename}${fcount}.ps"

for f in div* ; do
	read a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 < $f
	Draw "${a1}" "${a2}" "${a3}" "${a4}" "${a5}" "${a6}" "${a7}" "${a8}" "${a9}" "${a10}" "${a11}" "${a12}" "${a13}" "${a14}" "${a15}" "${a16}" "${fname}" 
	#echo "${a1} ${a2} ${a3} ${a4} ${a5} ${a6} ${a7} ${a8} ${a9} ${a10} ${a11} ${a12} ${a13} ${a14} ${a15} ${a16} ${fname} "
	fcount=$((fcount + 1))
	fname="${psbasename}${fcount}.ps"
done
# Clean the div file.
rm div*
echo "All right!"