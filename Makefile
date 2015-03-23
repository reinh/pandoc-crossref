all: filter pdf latex html md clean
	git commit -a -m "Update examples"

filter:
	git checkout master pandoc-crossref.hs demo.md

clean:
	git rm -f pandoc-crossref.hs

pdf: filter
	pandoc -t latex --filter ./pandoc-crossref.hs -o output.pdf -i demo.md
	pandoc -t latex --filter ./pandoc-crossref.hs -o output-chapters.pdf -i demo.md --chapters

latex: filter
	pandoc -t latex --filter ./pandoc-crossref.hs -o output.latex -i demo.md
	pandoc -t latex --filter ./pandoc-crossref.hs -o output-chapters.latex -i demo.md --chapters

html: filter
	pandoc -t html --filter ./pandoc-crossref.hs -o output.html -i demo.md
	pandoc -t html --filter ./pandoc-crossref.hs -o output-chapters.html -i demo.md -M chapters=True

md: filter
	pandoc -t markdown --filter ./pandoc-crossref.hs -o output.md -i demo.md
	pandoc -t markdown --filter ./pandoc-crossref.hs -o output-chapters.md -i demo.md -M chapters=True
