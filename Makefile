ifeq ($(USER),root)
$(info )
$(info 838388381 you can NOT run by root !!! )
$(info )
$(error )
endif

MakefileX:=$(shell realpath MakefileX)
MakefileX:=$(wildcard $(MakefileX))

#cpuN:=$(shell echo -n $$((`cat /proc/cpuinfo  |grep processor |wc -l` - 1 )))
ifndef cpuN
cpuN:=$(shell cat /proc/cpuinfo  |grep processor |wc -l |sed -e s,^,-1\ +\ ,g |xargs -l expr)
endif

debianVer1:=$(shell cat /etc/os-release  |grep VERSION_ID |cut -d\" -f 2|cut -d= -f 2|tr -d .)
ifeq (3213,$(debianVer1))
debianVer1:=3212
endif


# git clone --recursive https://github.com/redis/redis.git
# git submodule update --init --force --recursive
website:=https://github.com/redis/redis.git
version=8.0.0.5



nice:= chrt --idle 0 nice -n 19

extA:= -fPIC       -O3 -flto -ffunction-sections -fdata-sections -Wl,--gc-sections -Wl,--strip-all -Wl,-rpath,/home/nginX/LD_LIBRARY_PATH_3212

build_dir:=redis-$(version)
build_dir:=redis
dst_path:=$(shell realpath /home/nginX/Redis_$(version))_$(debianVer1)

define dispText

m:      $(m)
aaa:    $(aaa)
cb:     $(cb)   $($(cb))
clone:  $(clone)
b  		$(b)
bc 		$(bc)


website $(website)

dst_path:	$(dst_path)
build_dir:	$(build_dir)


MakefileX: $(MakefileX)


endef
export dispText

m:=vim Makefile
aaa:=clean help config make_build make_install 
aaa:=clean help config make_build 
aaa:=clean help config make_build make_install
aaa:=clean help config make_build  build_static make_install

display: Makefile
	@echo "$${dispText}"

Makefile: $(MakefileX)
	[ -z "$(MakefileX)" ] || cat $(MakefileX) > Makefile 



m:
	$(m)
aaa: $(aaa)

	
cs clear_src cr clean_rm:
	rm -fr     $(build_dir)

c clean: clear_src
	tar -xJf    $(build_dir).tar.xz

cb:=clear_dst_bin
$(cb):= chmod -R u+w $(dst_path) ; rm -fr $(dst_path)/* ; mkdir $(dst_path)/11 ;rmdir $(dst_path)/11 ;
cb $(cb):
	$($(cb))

h help:
	-cd $(build_dir)/ && ./configure --help 				> ../log.redis.01.help.txt
	

#--modules-path=/etc/nginxX/modules \

#conf config: 
#	cd $(build_dir)/ && \
#		CFLAGS="$(extA) " \
#		LDFLAGS="$(extA) " \
#		$(nice) \
#		./configure   \
#		--enable-static \
#		--enable-shared \
#		--prefix=$(dst_path) \
#		\
#		> ../log.redis.02.config.txt
#	@echo
sslX:=/home/nginX/QuitTLS_3.3.0-quic1_12

b:=build make make_build
b $(b): b1 b2

b1:
	(cd $(build_dir)/ && pwd && $(nice) \
		make  \
		\
		-j $(cpuN) \
		\
		PREFIX=$(dst_path) \
		\
		 CFLAGS="$(extA)   " \
		 CXXFLAGS="$(extA) " \
		 \
		> ../log.redis.03.make_build.txt)
	@echo

b2:
	@echo ; echo ==$@
	( cd  $(dst_path)/bin/ && tar cf - . ) | ( cd bin && tar xf - )
	ls -l $(dst_path)/bin/*     bin/*
	@echo
