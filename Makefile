# Toolset.

BROWSERIFY = node_modules/.bin/browserify
EXORCIST = node_modules/.bin/exorcist

# Bundle files.

BUNDLE = public/js/bundle.js

# These must be consistent
# with rules below.

MAP = $(BUNDLE).map

.DELETE_ON_ERROR:

all: $(BUNDLE)

$(BUNDLE): public/js/app/app.js public/js/app/*.js public/misc/*
	rm -f $(MAP)
	$(BROWSERIFY) --debug -t brfs -t uglifyify $< | $(EXORCIST) $(MAP) > $@

clean:
	rm -f $(BUNDLE) $(MAP)

.PHONY: all clean
