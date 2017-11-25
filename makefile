gdb_cn.pdf: gdb_cn.tex gdb_cn.toc gdb_cn-blx.bib
	pdflatex gdb_cn.tex

gdb_cn.toc: gdb_cn.tex gdb_cn-blx.bib
	pdflatex gdb_cn.tex

gdb_cn-blx.bib: cover_title_toc_bib/gdb_ref_book.bib
	pdflatex gdb_cn.tex
	bibtex gdb_cn

gdb_cn.tex: config/config.tex cover_title_toc_bib/toc.tex cover_title_toc_bib/title.jpg cover_title_toc_bib/title.tex

clean:
	find ./ -name '*.aux' -exec rm -rf '{}' \;
	find ./ -name '*.log' -exec rm -rf '{}' \;
	find ./ -name '*.out' -exec rm -rf '{}' \;

distclean: clean
	find ./ -name '*.toc' -exec rm -rf '{}' \;
	find ./ -name '*.lof' -exec rm -rf '{}' \;
	find ./ -name '*.lot' -exec rm -rf '{}' \;
	find ./ -maxdepth 1 -name '*.pdf' -exec rm -rf '{}' \;
	find ./ -name '*.bcf' -exec rm -rf '{}' \;
	find ./ -name '*.blg' -exec rm -rf '{}' \;
	find ./ -maxdepth 1 -name '*.xml' -exec rm -rf '{}' \;
	find ./ -maxdepth 1 -name '*.bib' -exec rm -rf '{}' \;
	find ./ -maxdepth 1 -name '*.bbl' -exec rm -rf '{}' \;
