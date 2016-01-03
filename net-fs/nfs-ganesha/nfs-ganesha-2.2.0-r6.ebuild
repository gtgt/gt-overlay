# Copyright 2014 Marcin Nowicki
# Distributed under the terms of the MIT License
# $Header: $

EAPI=4

inherit cmake-utils flag-o-matic git-r3

MY_PV=${PVR/-r/-}
DESCRIPTION="Gentoo overlay with nfs-ganesha (userspace NFS server)"
HOMEPAGE="https://github.com/${PN}/${PN}/wiki"
#SRC_URI="https://github.com/${PN}/${PN}/archive/V${MY_PV}.tar.gz"
EGIT_REPO_URI="https://github.com/nfs-ganesha/nfs-ganesha.git"
#EGIT_COMMIT="V${MY_PV}"
#EGIT_COMMIT="V${PV}-stable"

LICENSE="GPL-2"
S="${WORKDIR}/${PN}-${PV}/src"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug -doc +heimdal -jemalloc -xfs -ceph -glusterfs +glusterfs-only -gpfs -gpfs-only -pnfs-only -rdma -lustre -pt -hpss -zfs -panfs -proxy -dbus"

RDEPEND="net-libs/libtirpc[kerberos]
     virtual/krb5
     heimdal? ( app-crypt/heimdal )
		 jemalloc? ( dev-libs/jemalloc )
		 xfs? ( sys-fs/xfsprogs )
		 ceph? ( sys-cluster/ceph )
		 glusterfs? ( sys-cluster/glusterfs[fuse] )"
DEPEND="doc? ( app-doc/doxygen )
	    net-fs/nfs-utils[nfsidmap,nfsv4,nfsv41,kerberos,libmount,nfsdcld]
		${RDEPEND}"

CMAKE_BUILD_TYPE="Release"

MAKEOPTS="-j1"

pkg_pretend() {
	is-flag -march=native && die 'cannot compile with -march=native in cflags'
	use ceph && die 'ceph support does not compile. You are welcome to fix it.'
}

DOCS=( AUTHORS CHANGES LICENSES README TODO )

src_configure() {
# $(usex gss " " "-DCMAKE_DISABLE_FIND_PACKAGE_Krb5=ON")
  local mycmakeargs=(
    $(cmake-utils_use gss USE_GSS)
    $(cmake-utils_use rdma USE_NFS_MSK)
    $(cmake-utils_use rdma USE_9P_RDMA)

    $(cmake-utils_use debug)
  )
  if use gpfs-only; then
    mycmakeargs+=( -DBUILD_CONFIG=gpfs )
  elif use pnfs-only; then
    mycmakeargs+=( -DBUILD_CONFIG=vfs_pnfs_only )
  elif use glusterfs-only; then
    mycmakeargs+=(
	    $(cmake-utils_use glusterfs-only USE_FSAL_GLUSTER)
      $(cmake-utils_useno glusterfs-only _MSPAC_SUPPORT)
      $(cmake-utils_useno glusterfs-only USE_FSAL_CEPH)
      $(cmake-utils_useno glusterfs-only USE_FSAL_ZFS)
      $(cmake-utils_useno glusterfs-only USE_FSAL_LUSTRE)
      $(cmake-utils_useno glusterfs-only USE_FSAL_SHOOK)
      $(cmake-utils_useno glusterfs-only USE_FSAL_GPFS)
      $(cmake-utils_useno glusterfs-only USE_FSAL_PROXY)
      $(cmake-utils_useno glusterfs-only USE_FSAL_PANFS)
      $(cmake-utils_useno glusterfs-only USE_9P)
    )
  else
    mycmakeargs+=(
      $(cmake-utils_use dbus USE_DBUS)
      $(cmake-utils_use glusterfs USE_FSAL_GLUSTER)
      $(cmake-utils_use gpfs USE_FSAL_GPFS)
      $(cmake-utils_use ceph USE_FSAL_CEPH)
      $(cmake-utils_use xfs USE_FSAL_XFS)
      $(cmake-utils_use lustre USE_FSAL_LUSTRE)
      $(cmake-utils_use lustre USE_FSAL_SHOOK)
      $(cmake-utils_use panfs USE_FSAL_PANFS)
      $(cmake-utils_use proxy USE_FSAL_PROXY)
      $(cmake-utils_use hpss USE_FSAL_HPSS)
      $(cmake-utils_use pt USE_FSAL_PT)
    )
  fi
  cmake-utils_src_configure || die "cmake failed"
}

src_prepare() {
  if use heimdal; then
    sed -i 's/"gssapi_krb5"/"gssapi"/' ${S}/cmake/modules/FindKrb5.cmake
  fi
}

