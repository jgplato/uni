LATEX := pdflatex

MODULES   := analysis1 exp1 exp2 linalg theo1 theo2 analysis2 quantenmechanik fkp amol theoed gp1
SRC_DIR   := $(addprefix ,$(MODULES))
BUILD_DIR := $(addprefix build/,$(MODULES))

SRC       := $(foreach sdir,$(SRC_DIR),$(wildcard $(sdir)/*.tex))
OUT       := $(patsubst %.tex,build/%.pdf,$(SRC))

vpath %.tex $(SRC_DIR)

define make-goal
$1/%.pdf: $(subst build/,,$1)/%.tex
	cd `dirname $$@` && $(LATEX) ../../$$< && cd ../../
endef

.PHONY: all checkdirs clean pdfs

all: checkdirs pdfs

pdfs: $(OUT)

checkdirs: $(BUILD_DIR)

$(BUILD_DIR):
	@mkdir -p $@

clean:
	@rm -rf $(BUILD_DIR)

$(foreach bdir,$(BUILD_DIR),$(eval $(call make-goal,$(bdir))))
