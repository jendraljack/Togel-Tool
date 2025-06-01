#!/system/bin/sh
togel="$(dirname $(realpath $0))"
busybox echo -e "\n### Skrip ngecak 2D simple\n"
### Testing
if [ -z "$1" ]
then
busybox echo -e "### Salah, Sayangku..!\n### gunakan:\n bash $0 angkaFeeling.   \n"
kill -9 $$
fi

if [ ! -z "$2" ]
then
busybox echo -e "### Salah, Sayangku..!\n###\nSpasi gak diizinkan\ngunakan:\n   bash $0 angkaFeeling. \n"
kill -9 $$
fi

echo -n "$@" > $togel/angka
if [ -z "$(cat $togel/angka|grep "[0-9]")" ]
then
busybox echo -e "### Salah, Sayangku..\n### karakter $@ gk boleh\ninput Angka saja yahh.\n"
kill -9 $$
fi

if [ ! -z "$(cat $togel/angka|grep "[a-zA-Z]")" ]
then
busybox echo -e "### Salah, Sayangku..\n### karakter $@ gk boleh\ninput Angka saja yahh.\n"
kill -9 $$
fi

if [ "$(cat $togel/angka|busybox wc -c)" -gt "2" ]
then
busybox echo -e "### Salah, Sayangku..\n### untuk 2D saja saat ini\n"
kill -9 $$
fi

if [ "$(cat $togel/angka|busybox wc -c)" -lt "2" ]
then
busybox echo -e "### Salah, Sayangku..\n### maksimal 2D\n"
kill -9 $$
fi

### proses
cat $togel/angka|busybox fold -w 1 > $togel/lipat
cat $togel/lipat|busybox awk '{print "angka" NR+0 "=\"" $0 "\""}' > $togel/01-$(basename $0)
cat $togel/mlmbidx.sh >> $togel/01-$(basename $0)
bash $togel/01-$(basename $0)
echo "Memproses Angka Mistik $1..."
echo ""
sleep 5
cat $togel/data|busybox awk '{print $1 " = MistikBaru: " $2 ", MistikLama: " $3 ", Index: " $4 ".\n" $5 " = MistikBaru: " $6 ", MistikLama: " $7 ", Index: " $8 ".\n\nDikombinasikan:\n\nCrootttt...hahaha..\nAngka Awal => " $1$5 " BB " $5$1 "\n " $1$6" BB "$6$1 "\n "$1$7 " BB " $7$1 "\n "$1$8 " BB "$8$1"\n " $2$5 " BB " $5$2 "\n " $2$6 " BB " $6$2 "\n " $2$7 " BB " $7$2 "\n " $2$8 " BB " $8$2 "\n "$3$5 " BB "$5$3"\n " $3$6 " BB "$6$3 "\n " $3$7 " BB " $7$3 "\n "$3$8 " BB "$8$3 "\n "$4$5 " BB "$5$4 "\n "$4$6 " BB "$6$4 "\n "$4$7 " BB "$7$4 "\n "$4$8 " BB "$8$4}'
echo ""
busybox echo -e "Karya: orang gajelas juntrungan.. hahahaha\n"


if [ ! -d "$togel/cache" ]
then
mkdir $togel/cache
fi

mv $togel/*-$(basename $0) $togel/cache
