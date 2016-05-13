clean:
	rm -rf repo/

build-packages: clean
	cd bsntools && makepkg -s;\
	cd ../status-page && makepkg -s;\
	cd ../application && makepkg -s

create-repo: build-packages
	mkdir repo && mv */*.pkg.tar.xz repo && repo-add repo/bsn.db.tar.gz repo/*.pkg.tar.xz

sync-repo:
	cd repo && rsync -avz . ${repo_path}
