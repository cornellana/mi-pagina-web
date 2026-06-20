#!/bin/bash
# rename_photos.sh
# Coloca este script DENTRO de la carpeta de la galería (junto a las fotos)
# y ejecútalo desde ahí. Funciona para cualquier galería, sin editar nada.
#
# Uso:
#   cd ~/Downloads/<nombre-galeria>
#   chmod +x rename_photos.sh
#   ./rename_photos.sh

set -e
cd "$(dirname "$0")"
GALLERY_NAME="$(basename "$(pwd)")"

echo "Galeria: $GALLERY_NAME"
echo "Leyendo fecha de captura de cada foto..."
> /tmp/gallery_sort.txt

for f in *.jpg *.JPG; do
  [ -e "$f" ] || continue
  # Salta si ya tiene formato numerico (ya renombrada)
  if [[ "$f" =~ ^[0-9]+\.(jpg|JPG)$ ]]; then
    continue
  fi

  dt=$(mdls -raw -name kMDItemContentCreationDate "$f" 2>/dev/null)
  if [ -z "$dt" ] || [ "$dt" = "(null)" ]; then
    dt=$(mdls -raw -name kMDItemFSContentChangeDate "$f" 2>/dev/null)
  fi

  epoch=$(date -j -f "%Y-%m-%d %H:%M:%S %z" "$dt" "+%s" 2>/dev/null || true)
  if [ -z "$epoch" ]; then
    epoch=$(date -r "$f" "+%s")
  fi

  echo "$epoch|$f" >> /tmp/gallery_sort.txt
done

TOTAL=$(wc -l < /tmp/gallery_sort.txt | tr -d ' ')
echo "Fotos encontradas: $TOTAL"
echo "Ordenando cronologicamente y renombrando..."

sort -t'|' -k1,1n /tmp/gallery_sort.txt | cut -d'|' -f2 > /tmp/gallery_order.txt

i=1
while IFS= read -r f; do
  num=$(printf "%02d" "$i")
  mv -n "$f" "tmp_${num}.jpg"
  i=$((i+1))
done < /tmp/gallery_order.txt

for f in tmp_*.jpg; do
  mv "$f" "${f#tmp_}"
done

echo "Listo. $((i-1)) fotos renombradas como 01.jpg .. $(printf '%02d' $((i-1))).jpg"
echo "Siguiente paso: ejecuta ./extract_gps.sh"
