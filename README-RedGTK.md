## Red/GTK requirement

### Ubuntu 64 bits

```
sudo dpkg --add-architecture i386

sudo apt-get update

sudo apt-get install -y libc6:i386 libcurl4:i386 

sudo apt-get install -y libgtk-3-bin:i386 librsvg2-common:i386 libcanberra-gtk-module:i386 libcanberra-gtk3-module:i386 at-spi2-core:i386

sudo apt-get install -y dbus-x11:i386
```

### Ubuntu 32bits

```
sudo apt-get update

sudo apt-get install -y libc6 libcurl4 

sudo apt-get install -y libgtk-3-bin librsvg2-common libcanberra-gtk-module  libcanberra-gtk3-module  at-spi2-core 

sudo apt-get install -y dbus-x11
```

### Centos 64 bits

```
yum install -y glibc.i686 libcurl.i686 gtk3.i686
```

### Centos 32 bits

```
yum install -y glibc libcurl gtk3
```