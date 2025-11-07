#Makefile
.PHONY: env html clean

env:
	@echo "Creating or updating conda environment..."
	@if conda env list | grep -q "^myst-env"; then \
		echo "Environment already exists. Updating..."; \
		conda env update -f environment.yml; \
	else \
		echo "Creating new environment from environment.yml"; \
		conda env create -f environment.yml; \
	fi

html:
	@echo "Building HTML version of MyST site..."
	myst build --html

.PHONY: clean
	@echo "Cleaning up generated files..."
clean:
	rm -rf _build