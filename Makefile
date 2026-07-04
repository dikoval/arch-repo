CONFIG  := $(abspath config/makepkg.conf)
PKGDEST := $(abspath build)

PACKAGES := $(wildcard packages/*)
REPO_DB  := $(abspath build/dikoval-arch-repo.db.tar.zst)

all: sync build update-repo

sync:
	git submodule sync --recursive
	git submodule update --init --recursive

build: $(PACKAGES)

$(PACKAGES):
	@echo "Building $@..."
	mkdir -p $(PKGDEST)
	makepkg --config $(CONFIG) --dir $@ --clean --force --syncdeps --noconfirm PKGDEST=$(PKGDEST)

update-repo:
	@echo "Updating repo $(REPO_DB)..."
	mkdir -p $(PKGDEST)
	repo-add $(REPO_DB) $(PKGDEST)/*.pkg.tar.zst

lint:
	find "packages" -type f -iname "PKGBUILD" | xargs namcap

clean:
	rm -rf $(REPO_DB) $(PKGDEST)

.PHONY: all sync build clean $(PACKAGES)
