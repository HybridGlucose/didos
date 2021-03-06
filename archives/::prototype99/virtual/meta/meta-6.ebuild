# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Meta file to pull in packages to help keep the world file clean"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE="+composite-gui +browser +composite dev discord +efi +fat flash +fluxbox fslint +index irc +network-tray openbox overlay +processviewer remote-desktop spreadsheet steam +sudo terminal +terminal-fast text-editor +xfs"

REQUIRED_USE="
composite-gui? ( composite )
efi? ( fat )
|| ( fluxbox openbox )
|| ( terminal terminal-fast )
"

RDEPEND="
	composite-gui? ( lxqt-base/compton-conf )
	browser? ( www-client/firefox-bin )
	composite? ( x11-misc/compton )
	dev? ( app-portage/repoman )
	discord? ( net-im/discord-bin )
	fat? ( sys-fs/dosfstools )
	flash? ( www-plugins/adobe-flash )
	fluxbox? ( x11-wm/fluxbox lxqt-base/lxqt-meta[minimal] )
	fslint? ( app-misc/fslint )
	index? ( sys-apps/mlocate )
	irc? ( net-irc/kvirc )
	network-tray? ( gnome-extra/nm-applet )
	openbox? ( lxqt-base/lxqt-meta[-minimal] )
	overlay? ( app-portage/layman )
	processviewer? ( kde-plasma/plasma-meta[processviewer] )
	remote-desktop? ( net-misc/anydesk )
	spreadsheet? ( app-office/gnumeric )
	steam? ( games-util/steam-launcher )
	sudo? ( app-admin/sudo )
	terminal? ( lxqt-base/lxqt-meta[terminal] )
	terminal-fast? ( x11-terms/kitty )
	text-editor? ( kde-plasma/plasma-meta[text-editor] )
	xfs? ( sys-fs/xfsprogs )
	virtual/linux-sources[fat?]
"
