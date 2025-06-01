#!/system/bin/sh
fold="$(dirname $0)"
busybox echo -e "Kolab generator angka jadi 2D/ml/mb...\n"
echo "Tulis Angka 1 angka kepala kode alam?(0-9)"
read pala
case pala in
"1") echo "1 7 0" > $fold/data.txt;;
"2") echo "2 6 5" > $fold/data.txt;;
"3") echo "3 9 8" > $fold/data.txt;;
"4") echo "4 5 7" > $fold/data.txt;;
"5") echo "5 4 2" > $fold/data.txt;;
"6") echo "6 2 9" > $fold/data.txt;;
"7") echo "7 1 4" > $fold/data.txt;;
"8") echo "8 0 3" > $fold/data.txt;;
"9") echo "9 3 6" > $fold/data.txt;;
"0") echo "0 8 1" > $fold/data.txt;;
"*") kill -9 $$;;
esac

echo "Tulis Angka 1 angka ekor kode alam?(0-9)"
read ekor
case ekor in
"1") echo "1 7 0" >> $fold/data.txt;;
"2") echo "2 6 5" >> $fold/data.txt;;
"3") echo "3 9 8" >> $fold/data.txt;;
"4") echo "4 5 7" >> $fold/data.txt;;
"5") echo "5 4 2" >> $fold/data.txt;;
"6") echo "6 2 9" >> $fold/data.txt;;
"7") echo "7 1 4" >> $fold/data.txt;;
"8") echo "8 0 3" >> $fold/data.txt;;
"9") echo "9 3 6" >> $fold/data.txt;;
"0") echo "0 8 1" >> $fold/data.txt;;
"*") kill -9 $$;;
esac
echo "Pala = $pala"
if [ "$pala" = 1 ]
then
echo "$pala 0 7" > $fold/data.txt
fi
if [ "$pala" = 2 ]
then
echo "$pala 5 6" > $fold/data.txt
fi
if [ "$pala" = 3 ]
then
echo "$pala 8 9" > $fold/data.txt
fi
if [ "$pala" = 4 ]
then
echo "$pala 7 5" > $fold/data.txt
fi
if [ "$pala" = 5 ]
then
echo "$pala 2 4" > $fold/data.txt
fi
if [ "$pala" = 6 ]
then
echo "$pala 9 2" > $fold/data.txt
fi
if [ "$pala" = 7 ]
then
echo "$pala 4 1" > $fold/data.txt
fi
if [ "$pala" = 8 ]
then
echo "$pala 3 0" > $fold/data.txt
fi
if [ "$pala" = 9 ]
then
echo "$pala 6 3" > $fold/data.txt
fi
if [ "$pala" = 0 ]
then
echo "$pala 1 8" > $fold/data.txt
fi

echo "Ekor = $ekor "
#echo $ekor
if [ "$ekor" = 1 ]
then
echo "$ekor 0 7" >> $fold/data.txt
fi
if [ "$ekor" = 2 ]
then
echo "$ekor 5 6" >> $fold/data.txt
fi
if [ "$ekor" = 3 ]
then
echo "$ekor 8 9" >> $fold/data.txt
fi
if [ "$ekor" = 4 ]
then
echo "$ekor 7 5" >> $fold/data.txt
fi
if [ "$ekor" = 5 ]
then
echo "$ekor 2 4" >> $fold/data.txt
fi
if [ "$ekor" = 6 ]
then
echo "$ekor 9 2" >> $fold/data.txt
fi
if [ "$ekor" = 7 ]
then
echo "$ekor 4 1" >> $fold/data.txt
fi
if [ "$ekor" = 8 ]
then
echo "$ekor 3 0" >> $fold/data.txt
fi
if [ "$ekor" = 9 ]
then
echo "$ekor 6 3" >> $fold/data.txt
fi
if [ "$ekor" = 0 ]
then
echo "$ekor 1 8" >> $fold/data.txt
fi

cat $fold/data.txt|tr "\n" "#" > $fold/data2.txt
sed -i "s|#| |g" $fold/data2.txt
echo ""
cat $fold/data2.txt|awk '{ print "KePala " $1 "=ML " $2 ",MB " $3 "\nEkor " $4 "=ML " $5 ",MB " $6 "\ndikolab jadi\n" $1$4 "\n" $1$5 "\n" $1$6 "\n" $2$4 "\n" $2$5 "\n" $2$6"\n" $3$4 "\n" $3$5"\n" $3$6}'

echo "Dikolab pada: $(date)"
