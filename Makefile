VERSION=16.05.1

all:
	+cd llvm/build; $(MAKE)
	+cd llvm-translate; $(MAKE)

install:
	$(MAKE) -C llvm/build install
	$(MAKE) -C llvm-translate install
