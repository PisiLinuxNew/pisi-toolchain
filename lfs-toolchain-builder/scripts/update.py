import os
from bs4 import BeautifulSoup
import requests

# source URLs
mainUrl = requests.get("https://www.linuxfromscratch.org/lfs/view/stable/index.html")
sourceUrl = requests.get("https://www.linuxfromscratch.org/lfs/view/stable/chapter03/packages.html")
patchUrl = requests.get("https://www.linuxfromscratch.org/lfs/view/stable/chapter03/patches.html")


def writeSourceFile(source):
    with open("wget-list", "a") as f:
        f.write(source + "\n")


def writeMD5File(md5Text):
    with open("md5sums", "a") as f:
        f.write(md5Text + "\n")


def checkVersion():
    soupSource = BeautifulSoup(mainUrl.content, 'html.parser')
    lfsVersion = soupSource.find('h2').text.split()[-1]
    print(lfsVersion)
    if float(lfsVersion) > float("11.3"):  # FIXME: versionu dosyadan kontrol etmeli
        print("Mevcut sürümünüz LFS sürümünden eski güncellemek istiyor musunuz?")
    else:
        print("Mevcut sürümünüz LFS sürümü ile aynı. ")


# Get source address from last stable version of LFS
def updateSources(sourceUrl):
    # FIXME: Remove old wget-list and md5sums files
    try:
        os.system("rm -r wget-list")  # lfs-toolchain-builder/scripts/
        os.system("rm -r md5sums")  # lfs-toolchain-builder/scripts/
    except FileNotFoundError:
        pass

    global sourceName
    soupSource = BeautifulSoup(sourceUrl.content, 'html.parser')
    for link in soupSource.find_all('p'):
        sourceLink = (link.text).strip()
        if str(sourceLink).endswith("tar.xz") or str(sourceLink).endswith("tar.gz"):
            sourceName = str(sourceLink).split("/")[-1]
            source = (sourceLink.strip("Download:")).strip()
            writeSourceFile(source)

        if str(sourceLink).startswith("MD5"):
            md5 = sourceLink.split(" ")
            md5Text = md5[2] + "  " + sourceName + "\n"
            writeMD5File(md5Text)


def updatePatch(patchUrl):
    global sourceName
    soupPatch = BeautifulSoup(patchUrl.content, 'html.parser')
    for link in soupPatch.find_all('p'):
        sourceLink = (link.text).strip()
        if str(sourceLink).endswith("patch"):
            sourceName = str(sourceLink).split("/")[-1]
            source = (sourceLink.strip("Download:")).strip()
            writeSourceFile(source)

        if str(sourceLink).startswith("MD5"):
            md5 = sourceLink.split(" ")
            md5Text = md5[2] + "  " + sourceName + "\n"
            writeMD5File(md5Text)

def updatesRun(oldVersion, newVersion):
    pass

# FIXME: ARŞİV ADRESİNDEN DOSYA ADINI VE SÜRÜM NUMARASINI AYIKLA AL
def updateFiles(path):
    ignoreThisFile = ["host-reqs.sh", "update.py", "reqs.sh", "base-script.sh", "wget-list", "md5sums"]

    file_list = list(os.listdir(path))  # scripts dizini altındaki dosyaları listele
    for i in ignoreThisFile:  # remove ignoreThisFile from file_list
        file_list.remove(i)

    for fileName in file_list:
        if fileName.startswith("gcc") and fileName.endswith("pass2.sh"):
            with open(fileName, "r+") as f:
                lines = f.readlines()
                for l in lines:
                    if "mpfr" in l and l.startswith("tar"):
                        global mpfrOldVersion
                        mpfrOldVersion = l.split("/")[-1].strip().strip(".tar.xz").split("-")[1]
                    elif "gmp" in l and l.startswith("tar"):
                        gmpOldVersion = l.split("/")[-1].strip().strip(".tar.zx").split("-")[1]
                    elif "mpc-" in l and l.startswith("tar"):
                        mpcOldVersion = l.split("/")[-1].strip().strip(".tar.gz").split("-")[1]

    with open("wget-list", "r") as f:  # wget-list dosyasını içeriğini oku
        lines = f.readlines()
        for line in lines:
            if not line.strip().endswith(".patch"):
                if "mpfr" in line:
                    mpfrNewVersion = line.strip().rstrip(".tar.gxz").split("/")[-1].split("-")[-1]
                elif "gmp" in line:
                    gmpNewVersion = line.strip().rstrip(".tar.gxz").split("/")[-1].split("-")[-1]
                elif "mpc" in line:
                    mpcNewVersion = line.strip().rstrip(".tar.gxz").split("/")[-1].split("-")[-1]

        for i in file_list:
            fileName = i
            if i.startswith("tcl"):
                packageFile = i.strip(".sh")
            elif i.startswith("expect"):
                packageFile = i.strip(".sh")
            elif i.startswith("util"):
                packageFile = i.split("-")[0] + "-" + i.split("-")[1]
            else:
                packageFile = i.split("-")[0]

            for line in lines:  # herbir paket için paketadı ve sürüm al
                if not line.strip().endswith(".patch"):
                    packageName = line.strip().rstrip(".tar.gxz").split("/")[-1]
                    newVersion = line.strip().rstrip(".tar.gxz").split("/")[-1].split("-")[-1]
                    if packageName.startswith("tcl") or packageName.startswith("expect"):
                        packageName = packageName.split("-")[0]
                    elif packageName.startswith("util"):
                        packageName = packageName.split("-")[0] + "-" + packageName.split("-")[1]
                    else:
                        packageName = line.strip().rstrip(".tar.gxz").split("/")[-1].split("-")[0]

                if not (packageFile.startswith("tcl") or packageFile.startswith("expect") or fileName.startswith(
                        "libstdc")):
                    if "pass2" not in fileName and packageFile == packageName:
                        # FIXME: binutils, coreutils dosyasının son satırında eksi sürüm kalıyor. düzeltilmesi gerekir
                        os.rename(fileName, packageFile + "-" + newVersion + ".sh")
                        newFileName = packageFile + "-" + newVersion + ".sh"
                        # FIXME: gcc dosyasında mpfr,gmp,mpc paketlerinin sürümleri düzeltilecek: PASSED
                        if packageFile.startswith("gcc"):
                            try:
                                with open(newFileName, "r+") as f:
                                    contents = f.read()
                                    f.seek(0)
                                    f.write(
                                        contents.replace("mpfr-" + mpfrOldVersion, "mpfr-" + mpfrNewVersion).replace(
                                            "gmp-" + gmpOldVersion, "gmp-" + gmpNewVersion).replace(
                                            "mpc-" + mpcOldVersion, "mpc-" + mpcNewVersion).replace(
                                            fileName.strip(".sh"), newFileName.strip(".sh")))
                            except FileNotFoundError:
                                print("{}:No such file".format(fileName))
                        else:
                            try:
                                with open(newFileName, "r+") as f:
                                    contents = f.read()
                                    f.seek(0)
                                    f.write(contents.replace(fileName.strip(".sh"), newFileName.strip(".sh")))
                            except FileNotFoundError:
                                print("{}:No such file".format(fileName))

                    elif "pass2" in fileName and packageFile == packageName:
                        os.rename(fileName, packageName + "-" + newVersion + "-" + "pass2.sh")
                        newFileName = packageName + "-" + newVersion + "-" + "pass2.sh"
                        try:
                            with open(newFileName, "r+") as f:
                                contents = f.read()
                                f.seek(0)
                                f.write(contents.replace("mpfr-" + mpfrOldVersion, "mpfr-" + mpfrNewVersion).replace(
                                    "gmp-" + gmpOldVersion, "gmp-" + gmpNewVersion).replace("mpc-" + mpcOldVersion,
                                                                                            "mpc-" + mpcNewVersion).replace(
                                    fileName.strip("-pass2.sh"), newFileName.strip("-pass2.sh")))
                        except FileNotFoundError:
                            print("{}:No such file".format(fileName))

                elif packageFile.startswith("tcl") and packageName.startswith("tcl"):  # FIXME: PASSED
                    if os.path.exists(packageName + ".sh"):
                        continue
                    else:
                        os.rename(fileName, packageName + ".sh")
                        newFileName = packageName + ".sh"

                        try:
                            with open(newFileName, "r+") as f:
                                contents = f.read()
                                f.seek(0)
                                f.write(contents.replace(fileName.strip(".sh"), packageName))
                        except FileNotFoundError:
                            print("{}:No such file".format(fileName))

                elif packageFile.startswith("expect") and packageName.startswith("expect"):  # FIXME: PASSED
                    os.rename(fileName, packageName + ".sh")
                    newFileName = packageName + ".sh"
                    try:
                        with open(newFileName, "r+") as f:
                            contents = f.read()
                            f.seek(0)
                            f.write(contents.replace(fileName.strip(".sh"), packageName))
                    except FileNotFoundError:  # FIXME: son satırda eski veri kalıyor
                        print("{}:No such file".format(fileName))

                elif fileName.startswith("libstdc") and packageName.startswith("gcc"):  # FIXME: PASSED
                    oldVersion = fileName.strip(".sh").split("+")[-1]
                    try:
                        with open(fileName, "r+") as f:
                            contents = f.read()
                            f.seek(0)
                            f.write(contents.replace(oldVersion, newVersion))
                    except FileNotFoundError:
                        print("{}: No such file".format(fileName))
                    os.rename(fileName, fileName.strip(".sh").split("+")[0] + "++" + newVersion + ".sh")
                else:
                    pass


# checkVersion()
# updateSources(sourceUrl)
# updatePatch(patchUrl)
updateFiles(".")
