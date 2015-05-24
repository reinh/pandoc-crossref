all: demo.md pdf latex html md
	git commit -a -m "Update examples"

demo.md:
	git checkout master demo.md

pdf:
	pandoc -t latex --filter pandoc-crossref -o output.pdf -i demo.md
	pandoc -t latex --filter pandoc-crossref -o output-chapters.pdf -i demo.md --chapters
	pandoc -t latex --filter pandoc-crossref -o output-cref.pdf -i demo.md -M cref=True

latex:
	pandoc -t latex --filter pandoc-crossref -o output.latex -i demo.md
	pandoc -t latex --filter pandoc-crossref -o output-chapters.latex -i demo.md --chapters
	pandoc -t latex --filter pandoc-crossref -o output-cref.latex -i demo.md -M cref=True

html:
	pandoc -s -t html --filter pandoc-crossref -o output.html -i demo.md
	pandoc -s -t html --filter pandoc-crossref -o output-chapters.html -i demo.md -M chapters=True

md:
	pandoc -t markdown --filter pandoc-crossref -o output.md -i demo.md
	pandoc -t markdown --filter pandoc-crossref -o output-chapters.md -i demo.md -M chapters=True
