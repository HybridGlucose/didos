# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="true"
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Plasma filemanager focusing on usability"
HOMEPAGE="https://www.kde.org/applications/system/dolphin https://userbase.kde.org/Dolphin"
KEYWORDS="amd64 ~arm64 x86"
IUSE="cdda semantic-desktop thumbnail"

DEPEND="
	$(add_frameworks_dep kbookmarks)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kinit)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep solid)
	$(add_qt_dep qtconcurrent)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	media-libs/phonon[qt5(+)]
	semantic-desktop? (
		$(add_frameworks_dep baloo)
		$(add_frameworks_dep kfilemetadata)
		$(add_kdeapps_dep baloo-widgets)
	)
"
RDEPEND="${DEPEND}
	$(add_kdeapps_dep kio-extras)
	cdda? (
		$(add_kdeapps_dep libkcddb)
	)
	thumbnail? (
		$(add_kdeapps_dep ffmpegthumbs)
		$(add_kdeapps_dep thumbnailers)
	)
"

RESTRICT+=" test"

PATCHES=(
	"${FILESDIR}"/root.patch
)

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package semantic-desktop KF5Baloo)
		$(cmake-utils_use_find_package semantic-desktop KF5BalooWidgets)
		$(cmake-utils_use_find_package semantic-desktop KF5FileMetaData)
	)

	kde5_src_configure
}

pkg_postinst() {
	kde5_pkg_postinst

	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		has_version "kde-apps/ark:${SLOT}" || \
			elog "For compress/extract and other actions install kde-apps/ark:${SLOT}"

		has_version "kde-apps/kleopatra:${SLOT}" || \
			elog "For crypto actions install kde-apps/kleopatra:${SLOT}"
	fi
}
