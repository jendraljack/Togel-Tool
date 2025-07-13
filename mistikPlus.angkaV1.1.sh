#!/system/bin/sh
togel="$(dirname $(realpath $0))"
busybox echo -e "\n### Skrip ngecak 2D simple\n"
### Testing
if [ -z "$1" ]
then
busybox echo -e "### Salah, Sayangku..!\n### gunakan:\n bash $0 angkaFeeling.   \n"
exit 1
fi

if [ ! -z "$2" ]
then
busybox echo -e "### Salah, Sayangku..!\n###\nSpasi gak diizinkan\ngunakan:\n   bash $0 angkaFeeling. \n"
exit 1
fi

echo -n "$@" > $togel/angka
if [ -z "$(cat $togel/angka|grep "[0-9]")" ]
then
busybox echo -e "### Salah, Sayangku..\n### karakter $@ gk boleh\ninput Angka saja yahh.\n"
exit 1
fi

if [ ! -z "$(cat $togel/angka|grep "[a-zA-Z]")" ]
then
busybox echo -e "### Salah, Sayangku..\n### karakter $@ gk boleh\ninput Angka saja yahh.\n"
exit 1
fi

if [ "$(cat $togel/angka|busybox wc -c)" -gt "2" ]
then
busybox echo -e "### Salah, Sayangku..\n### untuk 2D saja saat ini\n"
echo
exit 1
fi

if [ "$(cat $togel/angka|busybox wc -c)" -lt "2" ]
then
busybox echo -e "### Salah, Sayangku..\n### maksimal 2D\n"
echo
exit 1
fi

echo "#!$(readlink /proc/$$/exe)" > $togel/00-$(basename $0)
echo "#!$(readlink /proc/$$/exe)" > $togel/01-$(basename $0)
### proses
cat $togel/angka|busybox fold -w 1 > $togel/lipat
## for min plus 1
cat $togel/lipat|busybox awk '{print "angkatk" NR+0 "=\"" $0 "\""}' >> $togel/00-$(basename $0)
busybox echo -e "if [ \"\$angkatk1\" == \"0\" ]\nthen\necho -n \"9 0 1 \" > $togel/datatk\nfi" >> "$togel/00-$(basename $0)"
busybox echo -e "if [ \"\$angkatk1\" == \"9\" ]\nthen\necho -n \"8 9 0 \" > $togel/datatk\nfi" >> "$togel/00-$(basename $0)"
busybox echo -e "if [ \"\$angkatk1\" != \"0\" ]\nthen\nif [ \"\$angkatk1\" -lt \"9\" ]\nthen\necho -n \"\$((\$angkatk1-1)) \$angkatk1 \$((\$angkatk1+1)) \" > $togel/datatk\nfi\nfi" >> "$togel/00-$(basename $0)"
busybox echo -e "if [ \"\$angkatk2\" == \"0\" ]\nthen\necho \"9 0 1 \" >> $togel/datatk\nfi" >> "$togel/00-$(basename $0)"
busybox echo -e "if [ \"\$angkatk2\" == \"9\" ]\nthen\necho \"8 9 0 \" >> $togel/datatk\nfi" >> "$togel/00-$(basename $0)"
busybox echo -e "if [ \"\$angkatk2\" != \"0\" ]\nthen\nif [ \"\$angkatk2\" -lt \"9\" ]\nthen\necho \"\$((\$angkatk2-1)) \$angkatk2 \$((\$angkatk2+1))\" >> $togel/datatk\nfi\nfi" >> "$togel/00-$(basename $0)"
bash "$togel/00-$(basename $0)"
## for mistik
cat $togel/lipat|busybox awk '{print "angka" NR+0 "=\"" $0 "\""}' >> $togel/01-$(basename $0)
cat $togel/mlmbidx.sh >> $togel/01-$(basename $0)
bash $togel/01-$(basename $0)
echo "Memproses Angka Mistik $1..."
echo ""
sleep 3
cat $togel/data|busybox awk '{print $1 " = MistikBaru: " $2 ", MistikLama: " $3 ", Index: " $4 ".\n" $5 " = MistikBaru: " $6 ", MistikLama: " $7 ", Index: " $8 ".\n\n Hasil kombinasi ML,MB,IDX:\n\n Angka Awal => " $1$5 " BB " $5$1 "\n " $1$6" BB "$6$1 "\n "$1$7 " BB " $7$1 "\n "$1$8 " BB "$8$1"\n " $2$5 " BB " $5$2 "\n " $2$6 " BB " $6$2 "\n " $2$7 " BB " $7$2 "\n " $2$8 " BB " $8$2 "\n "$3$5 " BB "$5$3"\n " $3$6 " BB "$6$3 "\n " $3$7 " BB " $7$3 "\n "$3$8 " BB "$8$3 "\n "$4$5 " BB "$5$4 "\n "$4$6 " BB "$6$4 "\n "$4$7 " BB "$7$4 "\n "$4$8 " BB "$8$4}'
echo
cat $togel/datatk|busybox awk '{print " Versi Acak min/plus 1:\n Awal:==> "$2$5" BB "$5$2"\n ==> "$1$5" BB "$5$1"\n ==> "$3$5" BB "$5$3"\n ==> "$2$4" BB "$4$2"\n ==> "$2$6" BB "$6$2}'
echo
busybox echo -e " Karya: Kahlil Gibran dkk..\n"

if [ ! -d "$togel/cache" ]
then
mkdir $togel/cache
fi
sleep 1
mv $togel/*-$(basename $0) $togel/cache
mv $togel/data $togel/cache
mv $togel/datatk $togel/cache
