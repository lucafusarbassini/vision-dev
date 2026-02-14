#!/bin/bash
# Build PDF from markdown chapters using pandoc + wkhtmltopdf

BOOK_DIR="/Users/fusar/Desktop/vision-development/book"
OUTPUT="/Users/fusar/Desktop/vision-development/THE_LANDSCAPE.pdf"
COMBINED="/Users/fusar/Desktop/vision-development/combined_book.md"
STYLE="/Users/fusar/Desktop/vision-development/book_style.css"

echo "=== Building THE LANDSCAPE PDF ==="

# Concatenate all chapters in order
cat \
  "$BOOK_DIR/00_TABLE_OF_CONTENTS.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/01_THE_BURDEN.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/02_DISEASE_MECHANISMS.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/04_THE_THERAPEUTIC_ARSENAL.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/05_PLATFORM_TECHNOLOGIES.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/06_THE_DIAGNOSTIC_REVOLUTION.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/07_AI_MEETS_BIOLOGY.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/08_CAREER_PATHS.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/09_THE_STARTUP_ECOSYSTEM.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/10_BIG_PHARMA_REALITY.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/11_THE_VISIONARIES.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/12_WHITE_SPACES.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/13_CONVERGENCE_POINTS.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/14_DECISION_FRAMEWORK.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/15_BUILDING_THE_DREAM.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/appendix_A_disease_reference.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/appendix_B_key_companies.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/appendix_C_recommended_reading.md" \
  <(echo -e "\n\n---\n\n") \
  "$BOOK_DIR/appendix_D_original_notes.md" \
  > "$COMBINED"

echo "Combined markdown: $(wc -w < "$COMBINED") words"

# Generate PDF with pandoc + wkhtmltopdf
pandoc "$COMBINED" \
  -o "$OUTPUT" \
  --pdf-engine=wkhtmltopdf \
  --css="$STYLE" \
  --metadata title="THE LANDSCAPE" \
  --metadata author="A Hyperdense Reference for Biomedical Vision Development" \
  --toc \
  --toc-depth=2 \
  --pdf-engine-opt=--enable-local-file-access \
  --pdf-engine-opt=--page-size \
  --pdf-engine-opt=A4 \
  --pdf-engine-opt=--margin-top \
  --pdf-engine-opt=25mm \
  --pdf-engine-opt=--margin-bottom \
  --pdf-engine-opt=25mm \
  --pdf-engine-opt=--margin-left \
  --pdf-engine-opt=20mm \
  --pdf-engine-opt=--margin-right \
  --pdf-engine-opt=20mm \
  --pdf-engine-opt=--footer-center \
  --pdf-engine-opt=[page] \
  --pdf-engine-opt=--footer-font-size \
  --pdf-engine-opt=9

echo "=== Done: $OUTPUT ==="
ls -lh "$OUTPUT"
