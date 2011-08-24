# <solar@gentoo> 2005
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# /etc/portage/bashrc.autopatch
# echo '((0${BASH_VERSION:0:1} > 2)) && . /etc/portage/bashrc.autopatch' >> /etc/portage/bashrc
# echo 'PATCH_OVERLAY=/usr/portage/local/patches/' >> /etc/make.conf
# mkdir -p /usr/portage/local/patches/

autopatch() {
	local diff level p patches patched 
	
	source /etc/init.d/functions.sh	

	[[ ! -d "$PATCH_OVERLAY_LOCAL" ]] && PATCH_OVERLAY_LOCAL="`echo ${PORTAGE_OVERLAY}|sed s/\ //`/patches"
	[[ ! -d "$PATCH_OVERLAY_LOCAL" ]] && return 0

	ebegin "Local autopatch enabled. Searching for ${PATCH_OVERLAY_LOCAL}/${CATEGORY}/${PN}/{$PV,all}-*.{patch,diff}"
	
	patches=$(ls -1 ${PATCH_OVERLAY_LOCAL}/${CATEGORY}/${PN}/{$PV,all}-*.{patch,diff} 2>/dev/null)
	[[ $patches == "" ]] && einfo "No autopatch found" && return 0

	if ! cd ${S}; then
		eerror "FAILED TO cd $S"
		return 1
	fi

	eend 
	ebegin "Patch(es) found: $patches"

	for p in ${patches}; do
		p=$(basename $p)
		diff=${PATCH_OVERLAY_LOCAL}/${CATEGORY}/${PN}/${p}
		if [[ -e $diff ]] && [ ! -e ${S}/.${p} ]; then
			patched=0
			for level in 1 0 2 3 4; do
				if [[ $patched == 0 ]]; then
					patch -g0 -F 100 --dry -p${level} >/dev/null < $diff
					if [ $? = 0 ]; then
						einfo "Applying auto patch: (-p${level}) ${p}"
						patch -g0 -F 100 -p${level} < $diff > /dev/null && patched=1
						touch ${S}/.${p}
					fi
				fi
			done
			[[ $patched != 1 ]] && eerror "FAILED auto patching $p"
		else
			[[ ! -e $diff ]] && eerror "$diff does not exist, unable to auto patch"
		fi
	done
	[[ $patched == 1 ]] && eend
	cd $OLDPWD
}

if [[ $EBUILD_PHASE == prepare ]]; then
	PATH=$PATH:/usr/sbin:/usr/bin:/bin:/sbin
	autopatch || exit
fi
