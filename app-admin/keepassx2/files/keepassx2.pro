message("See 'INSTALL' for configuration options.")
TEMPLATE = subdirs
isEmpty(PREFIX){
	PREFIX = /usr
}
message("Install Prefix:" $$PREFIX)
message("*** Makefile successfully generated.")
message("*** Start make now.")
