
SHELL = /bin/sh

#### Start of system configuration section. ####
top_srcdir = $(topdir)/.
srcdir = $(top_srcdir)/ext/zuby
topdir = ../..
hdrdir = $(top_srcdir)
VPATH = $(srcdir):$(topdir):$(hdrdir)
RUBYLIB = -
RUBYOPT = -rpurelib.rb
exec_prefix = $(prefix)
prefix = $(DESTDIR)/home/david/Downloads/AROS-20120626-source/bin/linux-i386/AROS/Development
sharedstatedir = $(prefix)/com
mandir = $(datarootdir)/man
psdir = $(docdir)
oldincludedir = $(DESTDIR)/usr/include
localedir = $(datarootdir)/locale
bindir = $(exec_prefix)/bin
libexecdir = $(exec_prefix)/libexec
sitedir = $(libdir)/ruby/site_ruby
htmldir = $(docdir)
vendorarchdir = $(vendorlibdir)/$(sitearch)
includedir = $(prefix)/include
infodir = $(datarootdir)/info
vendorlibdir = $(vendordir)/$(ruby_version)
sysconfdir = $(prefix)/etc
libdir = $(exec_prefix)/lib
sbindir = $(exec_prefix)/sbin
rubylibdir = $(libdir)/ruby/$(ruby_version)
docdir = $(datarootdir)/doc/$(PACKAGE)
dvidir = $(docdir)
vendordir = $(libdir)/ruby/vendor_ruby
datarootdir = $(prefix)/share
pdfdir = $(docdir)
archdir = $(rubylibdir)/$(arch)
sitearchdir = $(sitelibdir)/$(sitearch)
datadir = $(datarootdir)
localstatedir = $(prefix)/var
sitelibdir = $(sitedir)/$(ruby_version)

CC = /home/david/Downloads/AROS-20120626-source/bin/linux-i386/tools/crosstools/i386-aros-gcc -nix
LIBRUBY = $(LIBRUBY_A)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = -Wl,-R -Wl,$(libdir) -L$(libdir) 
LIBRUBYARG_STATIC = -l$(RUBY_SO_NAME)-static

RUBY_EXTCONF_H = 
CFLAGS   =  -g -O2 $(cflags) 
INCFLAGS = -I. -I../.. -I../../. -I../.././ext/zuby
DEFS     = 
CPPFLAGS =    
CXXFLAGS = $(CFLAGS) 
ldflags  = -L. 
dldflags = 
archflag = 
DLDFLAGS = $(ldflags) $(dldflags) $(archflag)
LDSHARED = ld
AR = ar
EXEEXT = 

RUBY_INSTALL_NAME = ruby
RUBY_SO_NAME = ruby
arch = i386-aros
sitearch = i386-aros
ruby_version = 1.8
ruby = ruby -I/home/david/Downloads/AROS-20120626-source/bin/linux-i386/AROS/David/arosruby -rfake  -I'$(topdir)'
RUBY = $(ruby)
RM = rm -f
MAKEDIRS = mkdir -p
INSTALL = /usr/bin/install -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 644
COPY = cp

#### End of system configuration section. ####

preload = 

libpath = . $(topdir)
LIBPATH =  -L. -L$(topdir)
DEFFILE = 

CLEANFILES = mkmf.log
DISTCLEANFILES = 

extout = $(topdir)/.ext
extout_prefix = $(extout)$(target_prefix)/
target_prefix = 
LOCAL_LIBS = 
LIBS =   -lm   -lc
SRCS = zuby.c
OBJS = zuby.o
TARGET = zuby
DLLIB = $(TARGET).so
EXTSTATIC = zuby
STATIC_LIB = $(TARGET).a

BINDIR        = $(extout)/bin
RUBYCOMMONDIR = $(extout)/common
RUBYLIBDIR    = $(RUBYCOMMONDIR)$(target_prefix)
RUBYARCHDIR   = $(extout)/$(arch)$(target_prefix)

TARGET_SO     = $(RUBYARCHDIR)/$(DLLIB)
CLEANLIBS     = $(RUBYARCHDIR)/$(TARGET).so $(RUBYARCHDIR)/$(TARGET).il? $(RUBYARCHDIR)/$(TARGET).tds $(RUBYARCHDIR)/$(TARGET).map
CLEANOBJS     = *.o *.a *.s[ol] *.pdb *.exp *.bak

all:		install
static:		$(STATIC_LIB) install-rb

clean:
		@-$(RM) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES)

distclean:	clean
		@-$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		@-$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)

realclean:	distclean
install: install-so install-rb

install-so: $(RUBYARCHDIR)
install-so: $(RUBYARCHDIR)/$(DLLIB)
install-rb: pre-install-rb install-rb-default
install-rb-default: pre-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
pre-install-rb-default: $(RUBYLIBDIR)
install-rb-default: $(RUBYLIBDIR)/gtk2.rb
$(RUBYLIBDIR)/gtk2.rb: $(srcdir)/lib/gtk2.rb $(RUBYLIBDIR)
	$(COPY) $(srcdir)/lib/gtk2.rb $(@D)
pre-install-rb-default: $(RUBYLIBDIR)/gtk2
install-rb-default: $(RUBYLIBDIR)/gtk2/MenuShell.rb
$(RUBYLIBDIR)/gtk2/MenuShell.rb: $(srcdir)/lib/gtk2/MenuShell.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/MenuShell.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/SeparatorMenuItem.rb
$(RUBYLIBDIR)/gtk2/SeparatorMenuItem.rb: $(srcdir)/lib/gtk2/SeparatorMenuItem.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/SeparatorMenuItem.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/Widget.rb
$(RUBYLIBDIR)/gtk2/Widget.rb: $(srcdir)/lib/gtk2/Widget.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/Widget.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/HSeparator.rb
$(RUBYLIBDIR)/gtk2/HSeparator.rb: $(srcdir)/lib/gtk2/HSeparator.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/HSeparator.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/TreeView.rb
$(RUBYLIBDIR)/gtk2/TreeView.rb: $(srcdir)/lib/gtk2/TreeView.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/TreeView.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/TreeIter.rb
$(RUBYLIBDIR)/gtk2/TreeIter.rb: $(srcdir)/lib/gtk2/TreeIter.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/TreeIter.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/Button.rb
$(RUBYLIBDIR)/gtk2/Button.rb: $(srcdir)/lib/gtk2/Button.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/Button.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/VBox.rb
$(RUBYLIBDIR)/gtk2/VBox.rb: $(srcdir)/lib/gtk2/VBox.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/VBox.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/MenuItem.rb
$(RUBYLIBDIR)/gtk2/MenuItem.rb: $(srcdir)/lib/gtk2/MenuItem.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/MenuItem.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/Window.rb
$(RUBYLIBDIR)/gtk2/Window.rb: $(srcdir)/lib/gtk2/Window.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/Window.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/Stock.rb
$(RUBYLIBDIR)/gtk2/Stock.rb: $(srcdir)/lib/gtk2/Stock.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/Stock.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/TextMark.rb
$(RUBYLIBDIR)/gtk2/TextMark.rb: $(srcdir)/lib/gtk2/TextMark.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/TextMark.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/TreeViewColumn.rb
$(RUBYLIBDIR)/gtk2/TreeViewColumn.rb: $(srcdir)/lib/gtk2/TreeViewColumn.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/TreeViewColumn.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/TextBuffer.rb
$(RUBYLIBDIR)/gtk2/TextBuffer.rb: $(srcdir)/lib/gtk2/TextBuffer.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/TextBuffer.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/Entry.rb
$(RUBYLIBDIR)/gtk2/Entry.rb: $(srcdir)/lib/gtk2/Entry.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/Entry.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/TreeSelection.rb
$(RUBYLIBDIR)/gtk2/TreeSelection.rb: $(srcdir)/lib/gtk2/TreeSelection.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/TreeSelection.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/HBox.rb
$(RUBYLIBDIR)/gtk2/HBox.rb: $(srcdir)/lib/gtk2/HBox.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/HBox.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/TextIter.rb
$(RUBYLIBDIR)/gtk2/TextIter.rb: $(srcdir)/lib/gtk2/TextIter.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/TextIter.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/Builder.rb
$(RUBYLIBDIR)/gtk2/Builder.rb: $(srcdir)/lib/gtk2/Builder.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/Builder.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/TextView.rb
$(RUBYLIBDIR)/gtk2/TextView.rb: $(srcdir)/lib/gtk2/TextView.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/TextView.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/Toolbar.rb
$(RUBYLIBDIR)/gtk2/Toolbar.rb: $(srcdir)/lib/gtk2/Toolbar.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/Toolbar.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/Frame.rb
$(RUBYLIBDIR)/gtk2/Frame.rb: $(srcdir)/lib/gtk2/Frame.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/Frame.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/Menu.rb
$(RUBYLIBDIR)/gtk2/Menu.rb: $(srcdir)/lib/gtk2/Menu.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/Menu.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/MenuBar.rb
$(RUBYLIBDIR)/gtk2/MenuBar.rb: $(srcdir)/lib/gtk2/MenuBar.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/MenuBar.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/Image.rb
$(RUBYLIBDIR)/gtk2/Image.rb: $(srcdir)/lib/gtk2/Image.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/Image.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/ListStore.rb
$(RUBYLIBDIR)/gtk2/ListStore.rb: $(srcdir)/lib/gtk2/ListStore.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/ListStore.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/CellRendererText.rb
$(RUBYLIBDIR)/gtk2/CellRendererText.rb: $(srcdir)/lib/gtk2/CellRendererText.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/CellRendererText.rb $(@D)
install-rb-default: $(RUBYLIBDIR)/gtk2/Label.rb
$(RUBYLIBDIR)/gtk2/Label.rb: $(srcdir)/lib/gtk2/Label.rb $(RUBYLIBDIR)/gtk2
	$(COPY) $(srcdir)/lib/gtk2/Label.rb $(@D)
$(RUBYARCHDIR):
	$(MAKEDIRS) $@
$(RUBYLIBDIR):
	$(MAKEDIRS) $@
$(RUBYLIBDIR)/gtk2:
	$(MAKEDIRS) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .cxx .cpp .C .o

.cc.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cxx.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cpp.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.C.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.c.o:
	$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) -c $<

$(RUBYARCHDIR)/$(DLLIB): $(OBJS) Makefile
	@-$(RM) $@
	@-$(MAKEDIRS) $(@D)
	$(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)

$(STATIC_LIB): $(OBJS)
	$(AR) cru $@ $(OBJS)
	@-ranlib $(DLLIB) 2> /dev/null || true

###
zuby.o: zuby.c $(hdrdir)/ruby.h $(topdir)/config.h $(hdrdir)/defines.h
