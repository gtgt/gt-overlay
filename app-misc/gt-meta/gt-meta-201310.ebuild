# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="GT's desktop meta package"
HOMEPAGE="http://www.calculate-linux.org"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+system +desktop +network +packers +tools +print wireless"

#system
RDEPEND="
system? (
	app-admin/logrotate
	app-admin/syslog-ng
	app-editors/nano
	app-portage/eix
  app-portage/elogv
	app-portage/gentoolkit
	app-portage/layman
	app-portage/smart-live-rebuild
	app-text/wgetpaste
	dev-vcs/git
	dev-vcs/qgit
	dev-vcs/kdesvn
	dev-vcs/subversion
	dev-vcs/mercurial
	media-gfx/splashutils
	media-fonts/terminus-font
	sys-apps/fakeroot
	sys-apps/man-pages
	sys-apps/man-pages-posix
	!sys-apps/hotplug
	sys-apps/ifplugd
	>sys-apps/baselayout-2.0.0
	sys-apps/v86d
	>=sys-boot/grub-1.99
	sys-boot/os-prober
	sys-fs/reiserfsprogs
	sys-fs/squashfs-tools
	sys-kernel/genkernel
	sys-kernel/module-rebuild
	sys-fs/eudev
	sys-power/cpufrequtils
	sys-process/vixie-cron
)
"
#desktop
#	=kde-base/gwenview-4.6.5
RDEPEND="${RDEPEND}
desktop? (
	kde-base/kdebase-meta
	kde-base/kdenetwork-meta
	kde-base/kdeutils-meta
	kde-base/kdepim-meta
	kde-base/kdegraphics-meta
	kde-base/kdegames-meta
	kde-base/kdeadmin-meta

	app-cdr/k3b
	kde-base/kate
	kde-base/kcron
	kde-base/kde-l10n
	kde-base/kdenetwork-filesharing
	kde-base/kdepasswd
	kde-base/kdeplasma-addons
	kde-base/kget
	kde-base/kmix
	kde-base/kdnssd
	kde-base/kopete
	kde-base/krdc
	kde-base/krfb
	kde-base/ksystemlog
	kde-base/kuser
	kde-base/libkcddb
	kde-base/libkcompactdisc
	kde-base/print-manager
	kde-base/thumbnailers
	kde-misc/eyesaver
	kde-misc/drop2ftp
	kde-misc/kgtk
	kde-misc/kio-ftps
	kde-misc/translatoid
  media-fonts/bitstream-cyberbit
  media-fonts/corefonts
  media-fonts/droid
  media-fonts/dejavu
  media-fonts/font-misc-misc
	media-gfx/digikam
	media-gfx/gimp
	media-plugins/alsa-plugins
	media-libs/glew
	media-libs/gst-plugins-good
	media-libs/gst-plugins-bad
	media-libs/gst-plugins-ugly
	media-plugins/gst-plugins-faac
	media-plugins/gst-plugins-jack
	media-plugins/gst-plugins-speex
	media-plugins/gst-plugins-xvid
	media-plugins/gst-plugins-x264
	media-plugins/kipi-plugins
	media-video/kdenlive
	media-video/kffmpegthumbnailer
	media-sound/alsa-utils
	media-sound/clementine
	media-sound/qjackctl
	net-dialup/qtwvdialer
	net-im/choqok
	net-irc/konversation
	net-misc/networkmanager
	net-misc/networkmanager-openvpn
	net-misc/networkmanager-pptp
	kde-misc/networkmanagement
	net-p2p/eiskaltdcpp
	net-p2p/ktorrent
	sys-block/partitionmanager
	sys-power/powernowd
	sys-power/powertop
	x11-apps/mesa-progs
	x11-misc/xclip
	x11-misc/xautomation
	x11-themes/gtk-engines-qtcurve
	x11-themes/qtcurve
	x11-themes/oxygen-gtk
	www-client/google-chrome
	www-client/firefox-bin
	www-client/rekonq
	www-plugins/oxygenkde
)
"
#x11
RDEPEND="${RDEPEND}
desktop? (
  media-fonts/font-alias
  media-fonts/font-util
  media-fonts/encodings
  x11-apps/appres
  x11-apps/bitmap
  x11-apps/iceauth
  x11-apps/luit
  x11-apps/mkfontdir
  x11-apps/mkfontscale
  x11-apps/sessreg
  x11-apps/setxkbmap
  x11-apps/smproxy
  x11-apps/x11perf
  x11-apps/xauth
  x11-apps/xbacklight
  x11-misc/xbindkeys
  x11-apps/xcmsdb
  x11-apps/xcursorgen
  x11-apps/xdpyinfo
  x11-apps/xdriinfo
  x11-apps/xev
  x11-apps/xf86dga
  x11-apps/xgamma
  x11-apps/xhost
  x11-apps/xinput
  x11-apps/xkbcomp
  x11-apps/xkbevd
  x11-apps/xkbutils
  x11-apps/xkill
  x11-apps/xlsatoms
  x11-apps/xlsclients
  x11-apps/xmodmap
  x11-apps/xpr
  x11-apps/xprop
  x11-apps/xrandr
  x11-apps/xrdb
  x11-apps/xrefresh
  x11-apps/xset
  x11-apps/xsetroot
  x11-apps/xvinfo
  x11-apps/xwd
  x11-apps/xwininfo
  x11-apps/xwud
  x11-misc/makedepend
  x11-misc/xbitmaps
  x11-misc/util-macros
  x11-themes/xcursor-themes
)
"
#tools
RDEPEND="${RDEPEND}
tools? (
	app-admin/hddtemp
	app-admin/sudo
	app-admin/testdisk
	app-cdr/cdw
	app-misc/mc
	app-misc/screen
	app-portage/emerge-delta-webrsync
	app-portage/genlop
	app-portage/gentoolkit-dev
	app-portage/portage-utils
	app-portage/ufed
	dev-tcltk/expect
	sys-apps/acl
	sys-apps/ethtool
	sys-apps/gptfdisk
	sys-apps/hdparm
	sys-apps/keyexec
	sys-apps/lm_sensors
	sys-apps/preload
	sys-apps/memtest86+
	sys-apps/pciutils
	sys-apps/pv
	sys-apps/smartmontools
	sys-apps/usbutils
	sys-apps/usb_modeswitch
	sys-devel/prelink
	sys-fs/dmraid
	sys-fs/dosfstools
	sys-fs/e2fsprogs
	sys-fs/jfsutils
	sys-fs/mdadm
	sys-fs/mtools
	sys-fs/ntfs3g
	sys-fs/xfsprogs
	sys-power/acpi
	sys-power/acpid
	sys-process/htop
	sys-process/iotop
)
"
#network
RDEPEND="${RDEPEND}
network? (
	net-analyzer/nmap
	net-analyzer/vnstat
	net-dialup/ppp
	net-dialup/pptpclient
	net-dialup/rp-pppoe
	net-dialup/wvdial
	net-dns/bind-tools
	net-fs/nfs-utils
	net-fs/samba
	net-misc/dhcpcd
	net-misc/bridge-utils
	net-misc/ntp
	net-misc/wol
)
"
#packers
RDEPEND="${RDEPEND}
packers? (
	app-arch/arj
	app-arch/dump
	app-arch/p7zip[rar]
	app-arch/unace
	app-arch/unarj
	app-arch/unzip
	app-arch/zip
	app-arch/xz-utils
)
"
#print
RDEPEND="${RDEPEND}
print? (
	net-print/cups-pdf
	net-print/cups
	net-print/gutenprint
)
"
#	net-print/hplip
#	net-print/hplip-plugin
#	net-print/samsung-unified-linux-driver

#wireless
RDEPEND="${RDEPEND}
wireless? (
	!net-wireless/iwl1000-ucode
	!net-wireless/iwl3945-ucode
	!net-wireless/iwl4965-ucode
	!net-wireless/iwl5000-ucode
	!net-wireless/iwl5150-ucode
	!net-wireless/iwl6000-ucode
	!net-wireless/iwl6050-ucode
	!net-wireless/rt73-firmware
	sys-kernel/linux-firmware

	net-wireless/b43-firmware
	net-wireless/bluez-firmware
	net-wireless/broadcom-sta
	net-wireless/ipw2100-firmware
	net-wireless/ipw2200-firmware
	net-wireless/linux-wlan-ng-firmware
	net-wireless/madwifi-ng
	net-wireless/madwifi-ng-tools
	net-wireless/madwimax
	net-wireless/prism54-firmware
	net-wireless/rtl8192se
	net-wireless/rtl8192se-firmware
	net-wireless/rtl8192su-firmware
	net-wireless/wireless-tools
	net-wireless/wpa_supplicant
	net-wireless/zd1201-firmware
	net-wireless/zd1211-firmware
)
"
DEPEND="${RDEPEND}"
