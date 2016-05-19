VERSION=16.05.2

all:
	+cd llvm/build; $(MAKE)
	+cd llvm-translate; $(MAKE)

install:
	echo PREFIX=$(PREFIX)
	env
	+cd llvm-translate; $(MAKE) PROJ_INSTALL_ROOT=/usr install

spkg:
	git clean -fdx
	git checkout debian
	#sed -i s/trusty/precise/g debian/changelog
	gbp buildpackage --git-submodules --git-upstream-branch=master --git-debian-branch=ubuntu --git-ignore-new -S -tc '--git-upstream-tag=v%(version)s'

upload:
	git push origin v$(VERSION)
	dput ppa:jamey-hicks/connectal ../llvm-atomicc_$(VERSION)-*_source.changes
