import os
from base import *

os.system("mkdir -p %s" % CACHE)
#J = Index("pisi-2.0","https://ciftlik.pisilinux.org/2.0/pisi-index.xml.xz")
J = Index("beta", "https://ciftlik.pisilinux.org/2.0-Beta.1/pisi-index.xml.xz")

K = Indexes()
K.addIndex(J)
K.setPriority("beta")

x = Docker(sys.argv[1], BASE, K)
#x.addRepo("farm", "http://farm.pisilinux.org/.nofarm-repo/x86_64/pisi-index.xml.xz",2)
#x.addRepo("pisi-2.0","http://ciftlik.pisilinux.org/pisi-2.0/pisi-index.xml.xz")
#x.addRepo("source","https://github.com/ertugerata/PisiLinux/raw/Pisi-2.0/pisi-index.xml.xz")
x.installWithPisi()
x.dockerImport("pisichrootbeta")
