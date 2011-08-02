# <solar@gentoo> 2005
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# /etc/portage/bashrc.autopatch
# echo '((0${BASH_VERSION:0:1} > 2)) && . /etc/portage/bashrc.autopatch' >> /etc/portage/bashrc
# echo 'PATCH_OVERLAY=/usr/portage/local/patches/' >> /etc/make.conf
# mkdir -p /usr/portage/local/patches/

autopatch() {
	local diff level p patches patched 
	
	echo -e ' \e[0;36m*\e[0m '"Local autopatch enabled (${PATCH_OVERLAY_LOCAL}/${CATEGORY}/${PN}/*.{patch,diff})"
	
	[[ ! -d "$PATCH_OVERLAY_LOCAL" ]] && return 0

	patches=$(ls -1 ${PATCH_OVERLAY_LOCAL}/${CATEGORY}/${PN}/*.{patch,diff} 2>/dev/null)
	[[ $patches == "" ]] && echo "!!! No autopatch found" && return 0

	if ! cd ${S}; then
		echo ">>> FAILED TO cd $S"
		return 1
	fi

	for p in ${patches}; do
		p=$(basename $p)
		diff=${PATCH_OVERLAY_LOCAL}/${CATEGORY}/${PN}/${p}
		if [[ -e $diff ]] && [ ! -e ${S}/.${p} ]; then
			patched=0
			for level in 1 0 2 3 4; do
				if [[ $patched == 0 ]]; then
					patch -g0 -F 10 --dry -p${level} >/dev/null < $diff
					if [ $? = 0 ]; then
						echo -e ' \e[0;36m*\e[0m '"auto patching (-p${level}) ${p}"
						patch -g0 -F 10 -p${level} < $diff > /dev/null && patched=1
						touch ${S}/.${p}
					fi
				fi
			done
			[[ $patched != 1 ]] && echo "!!! FAILED auto patching $p"
		else
			[[ ! -e $diff ]] && echo "!!! $diff does not exist, unable to auto patch"
		fi
	done
	cd $OLDPWD
}

if [[ $EBUILD_PHASE == prepare ]]; then
	PATH=$PATH:/usr/sbin:/usr/bin:/bin:/sbin
	autopatch || exit
fi
