FROM archlinux:base-devel

# Arch Linux treats its users as children and does not allow to run `makepkg` by `root` user
# so we create a new user with same permissions as `root`, but named differently :)
ENV BUILDER_USER="ci-builder"
RUN <<EOF
  useradd --no-create-home $BUILDER_USER
  echo "$BUILDER_USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$BUILDER_USER
EOF

# git is required to sync submodules with both `checkout` action and `make sync`
RUN pacman -Sy --needed --noconfirm git make namcap

CMD ["/usr/bin/sh"]
