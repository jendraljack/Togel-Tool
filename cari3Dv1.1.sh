#!/system/bin/sh
dwp="$(dirname $(realpath $0))"
if [ -z "$1" ]
then
busybox echo -e "\n### Gunakan: bash $0 katakunci/Nomor."
kill -9 $$
fi

if [ ! -f "$dwp/buku3D.txt" ]
then
busybox echo -e "\n### Tidak ada buku 3D.\nUnduh di github jendraljack\n"
kill -9 $$
fi
busybox echo -e "\n### Skrip pencari kode binatang 3D ###\n"
busybox echo -e "Mencari $@...\n"
sleep 2
echo -n "$@" > $dwp/input
jkata="$(cat $dwp/input|busybox wc -w)"
#
if [ "$jkata" -gt "1" ]
then
#echo -n $jkata > $dwp/jkata
cat $dwp/input|busybox tr ' ' '\x0a' > $dwp/input2
cat $dwp/input2|busybox awk -v jalur=$dwp '{print "if [ ! -z \"\$(cat " jalur "/buku3D.txt|grep -i \"" $0 "\")\" ]\nthen\ncat " jalur "/buku3D.txt|grep -i \"" $0 "\"\nfi\nif [ -z \"\$(cat " jalur "/buku3D.txt|grep -i \"" $0 "\")\" ]\nthen\necho \"\"\necho \"Kata Kunci " $0 " gak ada di Kitab... hahaha.\"\nfi"}' > $dwp/01-$(basename $0)
$(readlink /proc/$$/exe) $dwp/01-$(basename $0)
fi

if [ "$jkata" == "1" ]
then
busybox echo -e "#!$(readlink /proc/$$/exe)\nif [ ! -z \"\$(cat $dwp/buku3D.txt|grep -i \"$@\")\" ]\nthen\ncat $dwp/buku3D.txt|grep -i \"$@\"\nfi\nif [ -z \"\$(cat $dwp/buku3D.txt|grep -i \"$@\")\" ]\nthen\necho \"\"\necho \"Kata kunci $@ gak ada di kitab... hahaha\"\nfi" > $dwp/00-$(basename $0)
$(readlink /proc/$$/exe) $dwp/00-$(basename $0)
fi
echo ""
if [ ! -d "$dwp/cache" ]
then
mkdir $dwp/cache
fi

mv $dwp/*-$(basename $0) $dwp/cache

