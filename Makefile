all: filter pdf latex html md clean
	git commit -a -m "Update examples"

filter:
	git checkout master pandoc-crossref.hs demo.md

clean:
	git rm -f pandoc-crossref.hs

pdf: filter
	pandoc -t latex --filter pandoc-crossref -o output.pdf -i demo.md
	pandoc -t latex --filter pandoc-crossref -o output-chapters.pdf -i demo.md --chapters
	pandoc -t latex --filter pandoc-crossref -o output-cref.pdf -i demo.md -M cref=True

latex: filter
	pandoc -t latex --filter pandoc-crossref -o output.latex -i demo.md
	pandoc -t latex --filter pandoc-crossref -o output-chapters.latex -i demo.md --chapters
	pandoc -t latex --filter pandoc-crossref -o output-cref.latex -i demo.md -M cref=True

html: filter
	pandoc -s -t html --filter pandoc-crossref -o output.html -i demo.md
	pandoc -s -t html --filter pandoc-crossref -o output-chapters.html -i demo.md -M chapters=True

md: filter
	pandoc -t markdown --filter pandoc-crossref -o output.md -i demo.md
	pandoc -t markdown --filter pandoc-crossref -o output-chapters.md -i demo.md -M chapters=True
