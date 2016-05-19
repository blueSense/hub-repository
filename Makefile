clean:
	rm -rf repo/

build-packages: clean
	cd base && makepkg -s --noconfirm || true;\
	cd ../status-page && makepkg -s --noconfirm || true;\
    cd ../autoupdate && makepkg -s --noconfirm || true;\
	cd ../supernode && makepkg -s --noconfirm || true

create-repo: build-packages
	mkdir repo && cp */*.pkg.tar.xz repo && repo-add repo/bsn.db.tar.gz repo/*.pkg.tar.xz

sync-repo:
	cd repo && rsync -avz . ${repo_path}
