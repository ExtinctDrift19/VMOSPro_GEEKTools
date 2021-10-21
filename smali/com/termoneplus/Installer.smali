.class public Lcom/termoneplus/Installer;
.super Ljava/lang/Object;
.source "Installer.java"


# static fields
.field public static final APPINFO_COMMAND:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 37
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_b

    const-string v0, "libexeo-t1plus.so"

    .line 38
    sput-object v0, Lcom/termoneplus/Installer;->APPINFO_COMMAND:Ljava/lang/String;

    goto :goto_f

    :cond_b
    const-string v0, "libexec-t1plus.so"

    .line 40
    sput-object v0, Lcom/termoneplus/Installer;->APPINFO_COMMAND:Ljava/lang/String;

    :goto_f
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copy_executable(Ljava/io/File;Ljava/io/File;)Z
    .registers 8

    const v0, 0x8000

    new-array v1, v0, [B

    .line 95
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 96
    new-instance p1, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "-bak"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 97
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_36

    .line 98
    invoke-virtual {v2, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3

    if-nez v3, :cond_36

    return v4

    .line 102
    :cond_36
    :try_start_36
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 103
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 105
    :goto_40
    invoke-virtual {v5, v1, v4, v0}, Ljava/io/InputStream;->read([BII)I

    move-result p0

    if-lez p0, :cond_4a

    .line 106
    invoke-virtual {v3, v1, v4, p0}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_40

    .line 108
    :cond_4a
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 109
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 111
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_59

    .line 112
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    :cond_59
    const/4 p0, 0x1

    .line 115
    invoke-virtual {v2, p0}, Ljava/io/File;->setReadable(Z)Z

    move-result p1

    if-eqz p1, :cond_67

    .line 116
    invoke-virtual {v2, p0, v4}, Ljava/io/File;->setExecutable(ZZ)Z

    move-result p1
    :try_end_64
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_64} :catch_67

    if-eqz p1, :cond_67

    const/4 v4, 0x1

    :catch_67
    :cond_67
    return v4
.end method

.method public static installAppScriptFile()Z
    .registers 4

    .line 66
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 69
    invoke-static {}, Lcom/termoneplus/Application;->getScriptFilePath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/system/etc/mkshrc"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    sget-object v1, Lcom/termoneplus/Application;->settings:Lcom/termoneplus/Settings;

    .line 70
    invoke-virtual {v1}, Lcom/termoneplus/Settings;->sourceSystemShellStartupFile()Z

    move-result v1

    if-eqz v1, :cond_38

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 71
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_38

    .line 72
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ". "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    :cond_38
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v1, v2, :cond_44

    const-string v1, "test -f ~/.shrc && . ~/.shrc"

    .line 78
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_49

    :cond_44
    const-string v1, ". ~/.shrc"

    .line 80
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_49
    const-string v1, ". /proc/self/fd/0 <<EOF"

    .line 84
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "$(/data/data/com.github.huskydg.vmostool/lib/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/termoneplus/Installer;->APPINFO_COMMAND:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " aliases)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v1, "EOF"

    .line 86
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    .line 88
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-static {}, Lcom/termoneplus/Application;->getScriptFile()Ljava/io/File;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/termoneplus/Installer;->install_text_file([Ljava/lang/String;Ljava/io/File;)Z

    move-result v0

    return v0
.end method

.method public static install_asset(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)Z
    .registers 7

    const v0, 0x8000

    new-array v1, v0, [B

    const/4 v2, 0x0

    .line 127
    :try_start_6
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/4 p2, 0x2

    .line 128
    invoke-virtual {p0, p1, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object p0

    .line 130
    :goto_10
    invoke-virtual {p0, v1, v2, v0}, Ljava/io/InputStream;->read([BII)I

    move-result p1

    if-lez p1, :cond_1a

    .line 131
    invoke-virtual {v3, v1, v2, p1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_10

    .line 133
    :cond_1a
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 134
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_20} :catch_22

    const/4 p0, 0x1

    return p0

    :catch_22
    return v2
.end method

.method public static install_directory(Ljava/io/File;Z)Z
    .registers 4

    .line 44
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_e

    invoke-virtual {p0}, Ljava/io/File;->mkdir()Z

    move-result v0

    if-nez v0, :cond_e

    return v1

    :cond_e
    const/4 v0, 0x1

    xor-int/2addr p1, v0

    .line 47
    invoke-virtual {p0, v0, p1}, Ljava/io/File;->setReadable(ZZ)Z

    move-result p1

    if-eqz p1, :cond_1d

    .line 48
    invoke-virtual {p0, v0, v1}, Ljava/io/File;->setExecutable(ZZ)Z

    move-result p0

    if-eqz p0, :cond_1d

    const/4 v1, 0x1

    :cond_1d
    return v1
.end method

.method public static install_text_file([Ljava/lang/String;Ljava/io/File;)Z
    .registers 7

    const/4 v0, 0x0

    .line 53
    :try_start_1
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, p1}, Ljava/io/PrintWriter;-><init>(Ljava/io/File;)V

    .line 54
    array-length v2, p0

    const/4 v3, 0x0

    :goto_8
    if-ge v3, v2, :cond_12

    aget-object v4, p0, v3

    .line 55
    invoke-virtual {v1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 56
    :cond_12
    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 57
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    const/4 p0, 0x1

    .line 59
    invoke-virtual {p1, p0, p0}, Ljava/io/File;->setReadable(ZZ)Z

    move-result p0
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1d} :catch_1e

    return p0

    :catch_1e
    return v0
.end method
