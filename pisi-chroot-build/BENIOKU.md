
Argumanlar:
---------------------------
-y, --yardim          : Turkce yardim ekrani
-h, --help            : Ingilizce yardim ekrani

-A veya --kaynakarsiv : Derleme icin cekilen kaynak kodlarin bulundugu
                        dizini belirtmek icin kullanilir. Belirtilmezse
                        /etc/pisi/pisi.conf icinde belirtilen deger
                        kullanilir.

  sudo python pisichroot.py -A /var/baskacache/pisi/archives /home/test/paketdizini

-P veya --pisiarsiv   : Sisteme kurulacak olan pisi paketleri icin cache
                        dizinini belirmek icin kullanilir.  Belirtilmezse
                        /etc/pisi/pisi.conf icinde belirtilen deger kullanilir.

-p veya --paketadi    : Derlenecek olan paketin adi.  wget gibi

-d veya --dizin       : Derlenecek olan paketin pspec.xml dosyasinin yerini gosteren
                        tam dosya yolu

                        /home/test/Pisilinux/main/network/wget/pspec.xml

-u veya --url         : Derlenecek olan paketin pspec.xml dosyasinin yerini gosteren
                        tam dosya yolu

                       https://github.com/Pisilinux/main/network/wget/pspec.xml

-d veya --debug       : Pisi komutu debug ozelligi , on veya off

Kullanimi:

sudo python pisichroot.py -A /kaynakarsivi -P /pisiarsivi -d /home/test/Pisi/wget/pspec.xml -d off

sudo python pisichroot.py -A /kaynakarsivi -P /pisiarsivi -p wget -d on

sudo python pisichroot.py -A /kaynakarsivi -P /pisiarsivi -p https://github.com/developer/paket/pspec.xml

workflow: https://gist.github.com/ertugerata/1be7ac1e59baec6b8d77170f60644d80 
