# Personal Arch Linux repository
This repository contains a mix of AUR and custom packages, which I use.
Repository is hosted via GitHub Releases.

## How to add new package?
For AUR packages:
* `cd packages`
* `git submodule add <AUR git clone URL>`
* `git add . && git commit && git push`

For own packages:
TBD

## How to update existing package?
1. Update submodule - TODO
2. Re-build package - `make package/<name>` or push the changes for CI to build it

## How to add this repository to pacman?
Add next config piece to `/etc/pacman.conf`:
```
[dikoval-arch-repo]
Server = https://github.com/dikoval/arch-repo/releases/download/latest
SigLevel = Optional
```
