#!/system/bin/sh
folder="$(dirname $(realpath $0))"
busybox echo -e "\n### Menu buku 2D/3D/4D\n### Pilih Buku mana yg akan kamu gunakan? (1,2 atau 3)\n\n=> 1. Buku 2D.\n=> 2. Buku 3D.\n=> 3. Buku 4D.\n"
read menu
case menu in
"*");;
esac
echo -n $menu > "$folder/menu.log"
cat $folder/menu.log|busybox fold -w 1 > "$folder/menu2.log"
if [ ! -z "$(cat "$folder/menu2.log"|grep "[a-zA-Z]")" ]
then
busybox echo -e "\n### input \"$(cat $folder/menu.log)\" salah sayangku...\n### Input angka sesuai pilihan menu yah."
kill -9 $$
fi

if [ -z "$(cat "$folder/menu2.log"|grep "[a-zA-Z]")" ]
then
if [ "$(cat $folder/menu.log)" -gt "3" ]
then
busybox echo -e "\n### Salah sayangku...\n### Input kamu \"$(cat $folder/menu.log)\" itu diluar pilihan menu."
kill -9 $$
fi
fi

if [ "$(cat $folder/menu.log)" -lt "1" ]
then
busybox echo -e "\n### negatif dan 0 tidak boleh\n"
fi

if [ "$(cat $folder/menu.log)" == "1" ]
then
bash $folder/cari2Dv1.1.sh
fi

if [ "$(cat $folder/menu.log)" == "2" ]
then
bash $folder/cari3Dv1.1.sh
fi

if [ "$(cat $folder/menu.log)" == "3" ]
then
bash $folder/cari4Dv1.1.sh
fi

if [ ! -d "$folder/cache" ]
then
mkdir $folder/cache
fi

mv $folder/*.log $folder/cache
