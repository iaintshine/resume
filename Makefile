all: html pdf

pdf: resume.html
	wkhtmltopdf --load-error-handling ignore \
		"file://$(shell pwd)/resume.html" \
		resume.pdf


html: resume.css resume.md
	pandoc --standalone -H resume.css \
        --from markdown --to html \
        -o resume.html resume.md

clean:
	rm resume.html
	rm resume.pdf