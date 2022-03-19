= base.py nedir =

Pisi paketlerini derlemek icin gereken chroot ortami olusturmaya 
yarar. 

= Nasil calisir =

Pisi paketleri, metadata ve kurulacak dosyalarin bulundugu bir 
tar arsivinin zip ile paketlenmis halidir.  

zip acilip, icindeki tar  chroot dizinine acilirsa, paket pisi 
uygulamasina gerek kalmadan kurulmus olur.

chroot ortami icin gereken minimum paket listesini olusturma 
calismasi devam etmektedir.

Bu uygulama, her pspec dosyasini basarili derleyemeyebilir.
Burada amac, her bir pisi paketi uzerinde detayli calisarak,
derleme ve calisma zamani bagimliliklarini duzgun tespit 
edebilmektir.

= Nasil kullanilir =

Bu uygulamanin calismasi icin pisilinux sistem gerekmemektedir.
Herhangi bir linux dagitiminda kullanabilirsiniz. 

pspec.xml dosyası ile çalışmak için lxml kullanıldığı için sisteminize uygun lxml'i kurmanız gerekmektedir. 
- PisiLinux için;
`sudo pisi it python-lxml`

Calisma dizininizde paket adinda bir dizin olusturun.
paketler.txt dosyasinin icinde bulunan pisi paketlerini olusturdugunuz
paket dizini icine kopyalayin. Bu paketler minimum calisma ve derleme 
ortami olusturmak icin gerekli paketlerdir. Bu listeyi olusturma 
islemi devam etmektedir.

Uygulama icinde, farm binary deposu ve github kaynak deposu eklenmektedir.

Ornegin acl paketini derlemek icin:

  `sudo python base.py  chroot-dizin-adi kurulacak-paket-txt-listesi  paket-adi`

  `sudo python base.py  acl-chroot paketler.txt acl`

 
Yukaridaki komut, bulundugumuz dizinde paket alt dizininde bulunan pisi paketlerini 
kullanarak, acl-chroot dizinine chroot ortamini olusturur. Ardindan,  

   `pisi --ignore-safety -y bi acl ` 

komutunu calistirir.


