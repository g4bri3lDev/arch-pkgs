all::
	rm -rf public
	rm -rf aur
	rm -rf git
	mkdir aur
#	cd aur && cat ../aur-packages.conf | xargs yay -G
	cd aur && cat ../aur-packages.conf | xargs -I{} git clone "https://aur.archlinux.org/{}.git"
	cat /etc/makepkg.conf
	find . -type f -name PKGBUILD -execdir makepkg -d -s -f --noconfirm --skippgpcheck \;
	mkdir public -p
	cp **/*.tar.zst public -n
	cd aur && cp **/*.tar.zst ../public -n
	repo-add public/g4bri3l.db.tar.gz public/*.pkg.tar.zst
	cd public && tree -H '.' -L 1 --noreport --charset utf-8 > index.html
clean::
	rm -rf public
	rm -rf aur
	rm -rf git
	rm -rf **/*.tar.xz
	rm -rf **/*.tar.zst
	rm -rf **/src
	rm -rf **/pkg
	rm -rf **/dmenu
	rm -rf **/dwm
	rm -rf **/st
	rm -rf **/dwmblocks
	rm -rf **/slock
