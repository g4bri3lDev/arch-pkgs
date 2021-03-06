all::
	rm -rf public
	rm -rf aur
	rm -rf git
	mkdir aur
#	cd aur && cat ../aur-packages.conf | xargs yay -G
	cd aur && cat ../aur-packages.conf | xargs -I{} git clone "https://aur.archlinux.org/{}.git"
	curl https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/pacman/trunk/makepkg.conf -o makepkg.conf
	pwd
	find . -type f -name PKGBUILD -execdir makepkg -d -s -f --config /***/workspace/makepkg.conf --noconfirm --skippgpcheck \;
	mkdir public -p
	mv **/*.tar.zst public -n
	cd aur && mv **/*.tar.zst ../public -n
	repo-add public/g4bri3l.db.tar.gz public/*.pkg.tar.zst
	cd public && tree -H '.' -L 1 --noreport --charset utf-8 > index.html
	sed -i 's/<\/style>/<\/style>\n<script type="text\/javascript" async="" src="https:\/\/www.google-analytics.com\/analytics.js"><\/script>\n<script async src="https:\/\/www.googletagmanager.com\/gtag\/js?id=UA-113478083-1"><\/script>\n<\script>\n\twindow.dataLayer = window.dataLayer \|\| [];\n\tfunction gtag(){dataLayer.push(arguments);}\n\tgtag('js', new Date());\n\n\tgtag('config', 'UA-113478083-1');\n<\/script>/g' public/index.html
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
