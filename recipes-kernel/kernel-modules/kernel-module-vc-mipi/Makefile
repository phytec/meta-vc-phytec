TARGET = vc-mipi-vvcam

obj-m +=$(TARGET).o
$(TARGET)-objs += vc_mipi_camera.o vc_mipi_core.o vc_mipi_modules.o

ccflags-y += -I $(KERNEL_SRC)/drivers/media/i2c
ccflags-y += -O2 -Werror

SRC := $(shell pwd)

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	rm -rf $($(TARGET)-objs)
	make -C $(KERNEL_SRC) M=$(PWD) clean


#	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
#	rm -f Module.markers Module.symvers modules.order
#	rm -rf .tmp_versions Modules.symvers
