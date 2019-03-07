FILE = Frogger
#-----------------------------------------------------------------------
ABS_DIRECTORY = Directory/EFI/BOOT/
DIRECTORY_FILE = Directory/
FINAL_FILE = BOOTX64

all:	efi hex iso

efi:
		fasm $(FILE).asm

iso:
		mkdir -p $(ABS_DIRECTORY)
		mv $(FILE).efi $(FINAL_FILE).efi
		mv $(FINAL_FILE).efi $(ABS_DIRECTORY)
		mkisofs -o ISO.iso $(DIRECTORY_FILE)

hex:
		hexdump -C $(FILE).efi

.PHONY clean:
		rm ISO.iso
		rm -r $(DIRECTORY_FILE)
