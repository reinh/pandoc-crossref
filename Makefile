all: filter pdf latex html md clean
	git commit -a -m "Update examples"

filter:
	git checkout master pandoc-crossref.hs demo.md

clean:
	git rm -f pandoc-crossref.hs

pdf: filter
	pandoc -t latex --filter ./pandoc-crossref.hs -o output.pdf -i demo.md

latex: filter
	pandoc -t latex --filter ./pandoc-crossref.hs -o output.latex -i demo.md --chapters

html: filter
	pandoc -t html --filter ./pandoc-crossref.hs -o output.html -i demo.md

md: filter
	pandoc -t markdown --filter ./pandoc-crossref.hs -o output.md -i demo.md
