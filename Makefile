all::
	rm -rf public
	rm -rf aur
	rm -rf git
	mkdir aur
	cd aur && cat ../aur-packages.conf | xargs yay -G
	find . -type f -name PKGBUILD -execdir makepkg -d -s -f --noconfirm --skippgpcheck \;
	mkdir public -p
	cp **/*.tar.xz public -n
	cd aur && cp **/*.tar.xz ../public -n
	repo-add public/g4bri3l.db.tar.gz public/*.pkg.tar.xz
	cd public && tree -H '.' -L 1 --noreport --charset utf-8 > index.html
clean::
	rm -rf public
	rm -rf aur
	rm -rf git
	rm -rf **/*.tar.xz
	rm -rf **/src
	rm -rf **/pkg
	rm -rf **/dmenu
	rm -rf **/dwm
	rm -rf **/st
