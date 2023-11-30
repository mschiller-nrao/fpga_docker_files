#!/bin/bash
export LC_ALL=en_US
# *************************************************************************************** 
# *** This file is provided as-is.  Modifications to this file are at your own risk.  *** 
# *** The End User License Agreement was accepted during the creation of this script  *** 
# *** by the user: mschille                                                               
# *************************************************************************************** 
# Generated by MIP v6.2-026
PROMPT_TARG="F"
MIPPATH="/opt/questa_sim-2023.3_2.aol"
export MG_INSTALL_PID=`uname -n`-`date +%H.%M.%S`${RANDOM}
if [ "$HOME" = "" ]; then
   echo  HOME env variable is not set. Please set it to your home directory.
   exit 1
fi
if [[ ! -d "$HOME"  ]]; then
   echo HOME does not resolve to a valid directory.
   exit 1
fi
MIP_PATH_ERRORS=0
MIP_START_DIR=$HOME/mgc/$(basename "$MIPPATH")
NEWTARG=
NEWSRC=
NEWMIPLOC=
NEWDOCLOC=
SELF=`dirname "$(readlink -f $0)"`
SELF=$SELF/$(basename $0)
MIPBATCMD="-batch"
MIPBATPATH=`echo "$SELF"`
MIPSKIP=
MIPEXTRAARGS=
MIPTARG="/opt/questa/2023.3"
MIPSRC="/opt/questa_sim-2023.3_2.aol"
while [ $# -gt 0 ];
do
   if [ "$1" = "-tgt" ]; then
      shift
      NEWTARG=`echo -tgt \'"$1"\'` 
      PROMPT_TARG=F
   elif [ "$1" = "-src" ]; then
      shift
      NEWSRC=`echo -src \'"$1"\'` 
   elif [ "$1" = "-accesspath" ]; then
      shift
      NEWDOCLOC=`echo -accesspath \'"$1"\'` 
   elif [ "$1" = "-msiloc" ]; then
      shift
      NEWMIPLOC=`echo -msiloc "$1"` 
      MIP_START_DIR="$1"
   elif [ "$1" = "-batchremove" ]; then
      MIPBATCMD=`echo -block $1`
      MIPSKIP="T"
   elif [ "$1" = "-batchverify" ]; then
      MIPBATCMD=`echo -block $1`
      MIPSKIP="T"
   elif [ "$1" = "-repair" ]; then
      EXTRAARGS=`echo $EXTRAARGS "$1"`
   elif [ "$1" = "-nojw" ]; then
      EXTRAARGS=`echo $EXTRAARGS "$1"`
   elif [ "$1" = "-deleteUserModifiedFiles" ]; then
      EXTRAARGS=`echo $EXTRAARGS "$1"`
   elif [ "$1" = "-batchall" ]; then
      MIPBATCMD=`echo $1 -tgt "$MIPTARG"`
      MIPBATPATH=`echo -src "$MIPSRC"`
   elif [ "$1" = "-batchlicensed" ]; then
      MIPBATCMD=`echo $1 -tgt "$MIPTARG"`
      MIPBATPATH=`echo -src "$MIPSRC"`
   elif [ "$1" = "-batchupdate" ]; then
      MIPBATCMD=`echo $1 -tgt "$MIPTARG"`
      MIPBATPATH=`echo -src "$MIPSRC"`
   else
      echo "USAGE: $0 [-tgt <target>] [-src <source>] [-msiloc <path>] [-batchremove] [-repair]"
      exit 1
   fi
   shift
done
while [ ! -f "$MIPPATH" ];
do
	if [ "$MIPPATH" = "x" ]; then
		exit
	fi
	MIP_PATH_ERRORS=$((MIP_PATH_ERRORS + 1))
	if [ "$MIP_PATH_ERRORS" -gt 9 ]; then
		exit 1
	 fi
	echo "Could not find MIPPATH of: '$MIPPATH'"
	echo "Enter path to install.* (or 'x' to quit): "
	read MIPPATH
done
if [ "$PROMPT_TARG" = "T" ]; then
   echo "Enter a Target Directory: "
   read ENTERED_TARG
   ENTERED_TARG=`echo $ENTERED_TARG | sed 's/"//g'`
   NEWTARG=`echo -tgt \'"$ENTERED_TARG"\'` 
fi
if [ ! "$MIPSKIP" = "T" ]; then
   :
# *** ADD YOUR OWN PRE INSTALL COMMANDS BELOW HERE ***


# *** ADD YOUR OWN PRE INSTALL COMMANDS ABOVE HERE ***
fi
"$MIPPATH" -silent $MIPBATCMD "$MIPBATPATH" $NEWTARG $NEWSRC $NEWDOCLOC $NEWMIPLOC $EXTRAARGS <<!!
d
yes
!!
INSTALLEXIT=$?
if [ ! "$MIPSKIP" = "T" ]; then
   :
#
fi
if [ ! "$MIPSKIP" = "T" ]; then
   :
# *** ADD YOUR OWN POST INSTALL COMMANDS BELOW HERE ***


# *** ADD YOUR OWN POST INSTALL COMMANDS ABOVE HERE ***
fi
LASTEXIT=$?
if [ $INSTALLEXIT -ne 0 ]; then
   exit $INSTALLEXIT
fi
exit $LASTEXIT

##### BELOW HERE IS XML DATA #####

<batchFile>
	<source value="/opt/questa_sim-2023.3_2.aol"/>
	<target value="/opt/questa/2023.3"/>
	<installType value="all"/>
	<platform value="Linux Opteron"/>
	<release name="2023.3_2">
		<product name="GCC 64-bit" productroot="questa_sim-base"/>
		<product name="Questa SIM 64-bit" productroot="questa_sim-base"/>
		<product name="Questa SIM Documentation" productroot="questa_sim-base"/>
		<product name="Register Assistant" productroot="questa_sim-base"/>
	</release>
</batchFile>
