#!/bin/bash
# extract_gps.sh
# Ejecutar DESPUES de rename_photos.sh, desde dentro de la carpeta de la galeria.
# Funciona para cualquier galeria, sin editar nada.
#
# Uso:
#   cd ~/Downloads/<nombre-galeria>
#   chmod +x extract_gps.sh
#   ./extract_gps.sh
#
# Genera ~/Downloads/<nombre-galeria>_gps.csv (fichero pequeno de texto, sin fotos)

set -e
cd "$(dirname "$0")"
GALLERY_NAME="$(basename "$(pwd)")"
OUT="$HOME/Downloads/${GALLERY_NAME}_gps.csv"

echo "filename,lat,lon" > "$OUT"

for f in *.jpg; do
  [ -e "$f" ] || continue
  lat=$(mdls -raw -name kMDItemLatitude "$f" 2>/dev/null)
  lon=$(mdls -raw -name kMDItemLongitude "$f" 2>/dev/null)
  [ "$lat" = "(null)" ] && lat=""
  [ "$lon" = "(null)" ] && lon=""
  echo "$f,$lat,$lon" >> "$OUT"
done

echo "Listo. CSV generado en: $OUT"
echo "Total de filas: $(($(wc -l < "$OUT") - 1))"
echo "Dile a Claude: 'ya esta generado el csv de <nombre-galeria>'"
