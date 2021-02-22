CFLAGS += -std=gnu11 -g
EXES    = q1

all:  $(EXES)
clean:
	rm -f $(EXES)

BinaryTree: q1.c
# don't treat all and clean as file targets
.PHONY: all clean
