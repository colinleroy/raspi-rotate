# raspi-rotate
A convenient helper to set a Raspberry's touchscreen orientation.

## Installation
Download or clone the repository, then:

```bash
$ cd raspi-rotate
$ sudo make install
```

## Usage
The executable takes one argument, the desired rotation setting:

```bash
$ raspi-rotate-screen
usage: raspi-rotate-screen [rotation]
where rotation is one of:
    normal:                 no rotation
    cw, clockwise:          rotate 90° clockwise
    ccw, counter-clockwise: rotate 90° counter-clockwise
    ud:                     rotate 180°
```

For example, 
```bash
$ sudo raspi-rotate-screen ccw
Rotation set to CCW
```

## How it works
There are different ways to rotate a touchscreen's display (and touch input
matrix) on a Raspberry.

One of them is a `/boot/config.txt` parameter ; either `lcd_rotate` (for
GPIO-connected screens) or `display_rotate` (for HDMI-connected screens). This
is inconvenient in two ways:

* It requires a reboot
* It breaks most framebuffer programs like plymouth (hence breaking splashscreens)
* It still requires Xorg configuration for the touch matrix

Another one is using a dtoverlay parameter, for some touchscreens drivers:

```
dtoverlay=waveshare35a,rotate=270
```

Drawbacks of this method are:

* It requires a reboot
* It depends on the touchscreen dtoverlay, making it less portable

The third way is to handle rotation in Xorg. This is the method raspi-rotate
uses. It still has some drawbacks:

* It requires restarting Xorg
* During boot, the kernel messages are not rotated

The advantages are:

* It is still possible to use Plymouth to display splash screens (even though it
requires rotated images, this is better than static)
* It is portable and should work with any touchscreen
