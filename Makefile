update-results:
	rtt preprocess --download-only
	rtt compute
	rtt publish --last
	./update_results_to_publish.sh

install:
	pip install -U ranking-table-tennis \
		mkdocs-material \
    	mkdocs-macros-plugin \
    	mkdocs-awesome-pages-plugin

serve:
	mkdocs serve