CONFIG  := $(abspath config/makepkg.conf)
PKGDEST := $(abspath build)

PACKAGES := $(wildcard packages/*)
REPO_DB  := $(abspath build/arch-repo.db.tar.zst)

all: $(PACKAGES) update-repo

$(PACKAGES):
	@echo "Building $@..."
	mkdir -p $(PKGDEST)
	makepkg --config $(CONFIG) --dir $@ --clean --force --syncdeps PKGDEST=$(PKGDEST)

update-repo:
	@echo "Updating repo $(REPO_DB)..."
	mkdir -p $(PKGDEST)
	repo-add $(REPO_DB) $(PKGDEST)/*.pkg.tar.zst

sync:
	git submodule update --init --recursive

clean:
	rm -rf $(REPO_DB) $(PKGDEST)

.PHONY: all $(PACKAGES) sync clean
