#!/system/bin/sh
dwp="$(dirname $(realpath $0))"
busybox echo -e "\nInput Kata kunci yang akan dicari minimal 1 kata bahasa indonesia jika input Angka ikuti simbol =\nmisalnya: 55= \n\n"
read toto
case toto in
"*");;
esac

if [ ! -f "$dwp/buku2D.dat" ]
then
busybox echo -e "\n### Tidak ada buku 2D."
kill -9 $$
fi
busybox echo -e "\n### Skrip pencari kode binatang/alam/mimpi 2D ###\n"
busybox echo -e "Mencari $toto...\n"
sleep 2
echo -n "$toto" > $dwp/input
cat $dwp/input|busybox fold -w 1 > $dwp/splitinput
if [ ! -z "$(cat $dwp/splitinput|grep "[0-9]")" ]
then
if [ ! -z "$(cat $dwp/splitinput|grep "[a-zA-Z]")" ]
then
busybox echo -e "\n### Jika input angka jangan input dengan huruf/kata. atau\n### Jika input huruf/kata jangan input dengan angka\n"
kill -9 $$
fi
fi
#
jkata="$(cat $dwp/input|busybox wc -w)"
jstring="$(cat $dwp/input|busybox wc -c)"

if [ ! -z "$(cat $dwp/splitinput|grep "[0-9]")" ]
then
if [ "$jstring" -gt "2" ]
then
if [ -z "$(cat $dwp/splitinput|grep "=")" ]
then
busybox echo -e "\n### khusus 2D sayangku..\n"
kill -9 $$
fi
fi
fi
####
if [ "$jstring" == "1" ]
then
busybox echo -e "\nMinimal Satu kata bahasa indonesia jika angka maksimal 2D\n"
kill -9 $$
fi
#
if [ "$jkata" -gt "1" ]
then
#echo -n $jkata > $dwp/jkata
cat $dwp/input|busybox tr ' ' '\x0a' > $dwp/input2
cat $dwp/input2|busybox awk -v jalur=$dwp '{print "if [ ! -z \"\$(cat " jalur "/buku2D.dat|grep -i \"" $0 "\")\" ]\nthen\ncat " jalur "/buku2D.dat|grep -i \"" $0 "\"\nfi\nif [ -z \"\$(cat " jalur "/buku2D.dat|grep -i \"" $0 "\")\" ]\nthen\necho \"\"\necho \"Ejaan " $0 " salah atau gak ada di Kitab... hahaha.\"\nfi"}' > $dwp/01-$(basename $0)
$(readlink /proc/$$/exe) $dwp/01-$(basename $0)
fi

if [ "$jkata" == "1" ]
then
busybox echo -e "#!$(readlink /proc/$$/exe)\nif [ ! -z \"\$(cat $dwp/buku2D.dat|grep -i \"$toto\")\" ]\nthen\ncat $dwp/buku2D.dat|grep -i \"$toto\"\nfi\nif [ -z \"\$(cat $dwp/buku2D.dat|grep -i \"$toto\")\" ]\nthen\necho \"\"\necho \"Ejaan $toto salah atau gak ada di kitab... hahaha\"\nfi" > $dwp/00-$(basename $0)
$(readlink /proc/$$/exe) $dwp/00-$(basename $0)
fi
echo ""
if [ ! -d "$dwp/cache" ]
then
mkdir $dwp/cache
fi

mv $dwp/*-$(basename $0) $dwp/cache
mv $dwp/input $dwp/cache
mv $dwp/splitinput $dwp/cache


