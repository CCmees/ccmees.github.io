# Variables
ASCIIDOCTOR = asciidoctor
SRC_DIR = src
HTML_DIR = html

# Find all AsciiDoc source files in the source directory
SRC_FILES := $(wildcard $(SRC_DIR)/*.asciidoc)

# Generate HTML output
HTML_OUTPUT_FILES := $(patsubst $(SRC_DIR)/%.asciidoc,$(HTML_DIR)/%.html,$(SRC_FILES))
$(HTML_DIR)/%.html: $(SRC_DIR)/%.asciidoc
	$(ASCIIDOCTOR) -o $@ $<

# Targets
all: html

html: $(HTML_OUTPUT_FILES)

clean:
	rm -rf $(HTML_DIR)
