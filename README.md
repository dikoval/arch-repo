# Personal Arch Linux repository

[![Build and release](https://github.com/dikoval/arch-repo/actions/workflows/build-release.yml/badge.svg?branch=master)](https://github.com/dikoval/arch-repo/actions/workflows/build-release.yml)
[![Build Docker image](https://github.com/dikoval/arch-repo/actions/workflows/build-docker.yml/badge.svg)](https://github.com/dikoval/arch-repo/actions/workflows/build-docker.yml)
[![GitHub Release Date](https://img.shields.io/github/release-date/dikoval/arch-repo?display_date=created_at)](https://github.com/dikoval/arch-repo/releases)

This repository contains a mix of AUR and custom packages, which I use.
Repository is hosted via GitHub Releases.

## How to add new package?
For AUR packages:
* `cd packages`
* `git submodule add <AUR git clone URL>`
* `git add . && git commit && git push`

For own packages:
* `cd packages`
* `mkdir <package-name>`
* `vim <package-name>/PKGBUILD`

## How to update existing package?
1. Update submodule - TODO
2. Re-build package - `make package/<package-name>` or push the changes for CI to build it

## How to add this repository to pacman?
Add next config piece to `/etc/pacman.conf`:
```
[dikoval-arch-repo]
Server = https://github.com/dikoval/arch-repo/releases/download/latest
SigLevel = Optional
```
