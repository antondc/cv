PDF_STANDARD := ua-1

.PHONY: all watch clean

all:
	typst compile antonio_diaz_cv.typ antonio_diaz_cv.pdf --pdf-standard $(PDF_STANDARD)
	typst compile antonio_diaz_cover.typ antonio_diaz_cover.pdf --pdf-standard $(PDF_STANDARD)

watch:
	typst watch antonio_diaz_cv.typ antonio_diaz_cv.pdf --pdf-standard $(PDF_STANDARD) & \
	typst watch antonio_diaz_cover.typ antonio_diaz_cover.pdf --pdf-standard $(PDF_STANDARD) & \
	wait

clean:
	rm -f antonio_diaz_cv.pdf antonio_diaz_cover.pdf
