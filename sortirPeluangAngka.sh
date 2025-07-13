#!/system/bin/sh
dirfold="$(dirname $(realpath $0))"
if [ ! -d "$dirfold/cache/sortit" ]
then
mkdir -p $dirfold/cache/sortir
fi
###
if [ -z "$1" ]
then
echo
echo "### Ada yang salah..."
echo "### Gunakan: bash $(basename $0) berkasKeluaran.txt"
echo
exit 1
fi

echo "########################"
echo "Angka keluaran HK 9x terakhir"
echo 
cat $(dirname $(realpath $1))/$(basename $1)
echo
cat $(dirname $(realpath $1))/$(basename $1)|grep -o "[0-9]" > $dirfold/cache/split1
cat $dirfold/cache/split1|grep 1 > $dirfold/cache/sortir/1
cat $dirfold/cache/split1|grep 2 > $dirfold/cache/sortir/2
cat $dirfold/cache/split1|grep 3 > $dirfold/cache/sortir/3
cat $dirfold/cache/split1|grep 4 > $dirfold/cache/sortir/4
cat $dirfold/cache/split1|grep 5 > $dirfold/cache/sortir/5
cat $dirfold/cache/split1|grep 6 > $dirfold/cache/sortir/6
cat $dirfold/cache/split1|grep 7 > $dirfold/cache/sortir/7
cat $dirfold/cache/split1|grep 8 > $dirfold/cache/sortir/8
cat $dirfold/cache/split1|grep 9 > $dirfold/cache/sortir/9
cat $dirfold/cache/split1|grep 0 > $dirfold/cache/sortir/0
echo
echo "Peluang keluar angka"
sortiR(){
find $dirfold/cache/sortir -type f > $dirfold/cache/split2
cat $dirfold/cache/split2|busybox awk '{print "echo -n \"angka => \$(basename " $0 ") sudah keluar \"\necho \"\$((\$(cat " $0"|wc -c)/2)) kali\""}' > $dirfold/00-$(basename $0)
bash "$dirfold/00-$(basename $0)"
sleep 3
echo
echo "Hari ini: $(/system/bin/date|busybox awk '{print $1,$3"-"$2"-"$6,$5}')"
echo
echo "###################"
 }
  sortiR
   mv $dirfold/0*-* $dirfold/cache
