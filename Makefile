
all:
	+cd llvm/build; $(MAKE)
	+cd llvm-translate; $(MAKE)

install:
	$(MAKE) -C llvm/build install
	$(MAKE) -C llvm-translate install
