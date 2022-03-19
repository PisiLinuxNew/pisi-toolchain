import syslog, time, sys

class Kayit:
    def __init__(self, dosya_adi):
        try:
            self.dosya_adi = dosya_adi
            f = open(self.dosya_adi,"a")
            f.close()
        except:
            print "%s kayit dosyasina erisim sorunu" % self.dosya
            sys.exit(1)

    def mesaj(self, m):
        t = logtime()
        d = open(self.dosya_adi, "a")
        if type(m) is list:
            for satir in m:
                d.write("%s %s\n" % (t, satir[:-1]))
        elif type(m) is dict:
            for a,b in m.items():
                d.write("%s %s=%s\n" % (t, a, b))
        else:
            d.write("%s %s\n" % (t, m))
        d.close()


def logtime():
  t = time.localtime()
  return "%s%02d%02d-%02d:%02d:%02d" % (t[0], int(t[1]), int(t[2]), int(t[3]), int(t[4]), int(t[5]))
