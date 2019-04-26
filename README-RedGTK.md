## Red/GTK requirement

### Ubuntu 64 bits

```
sudo dpkg --add-architecture i386

sudo apt-get update && apt-get install -y wget && apt-get install -y git

sudo apt-get install -y libc6:i386 libcurl4:i386 

sudo apt-get install -y libgtk-3-bin:i386 librsvg2-common:i386 libcanberra-gtk-module:i386 libcanberra-gtk3-module:i386 at-spi2-core:i386

sudo apt-get install -y dbus-x11:i386
```

### Ubuntu i386


