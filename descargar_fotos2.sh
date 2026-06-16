#!/usr/bin/env bash
set -e
BASE="$HOME/Pictures/Portfolio"
B="https://cornellana.online/wp-content/uploads/2024/03"

download() {
  local dir="$1"; shift
  local n=1
  mkdir -p "$BASE/$dir"
  for url in "$@"; do
    local dst="$BASE/$dir/$(printf '%02d' $n).jpg"
    if [ ! -f "$dst" ]; then
      curl -s -L --max-time 30 "$url" -o "$dst" && echo "  ✓ $dir/$n" || echo "  ✗ $dir/$n FALLO"
    else
      echo "  – $dir/$n ya existe"
    fi
    n=$((n+1))
  done
}

echo "── Arches ──────────────────────────────────────────────────"
download arches \
  "$B/Wix%20ON1%20_7R37925-scaled.jpg" \
  "$B/Wix%20ON1%20DSC05283-scaled.jpg" \
  "$B/Wix%20ON1%20_7R38236-scaled.jpg" \
  "$B/Wix%20ON1%20_7R38340-scaled.jpg" \
  "$B/Wix%20ON1%20_7R38142-scaled.jpg" \
  "$B/Wix%20ON1%20_7R38194-scaled.jpg" \
  "$B/Wix%20ON1%20_7R38180-scaled.jpg" \
  "$B/Wix%20ON1%20_7R38143-scaled.jpg" \
  "$B/Wix%20ON1%20_7R37923-scaled.jpg" \
  "$B/Wix%20ON1%20_7R38192-scaled.jpg" \
  "$B/Wix%20ON1%20_7R38129%201-scaled.jpg" \
  "$B/Wix%20ON1%20DSC05278-scaled.jpg" \
  "$B/Wix%20ON1%20_7R38122-scaled.jpg" \
  "$B/Wix%20ON1%20_7R38321-scaled.jpg" \
  "$B/Wix%20ON1%20DSC05222-scaled.jpg" \
  "$B/Wix%20ON1%20_7R37984-scaled.jpg" \
  "$B/Wix%20ON1%20_7R38082-scaled.jpg" \
  "$B/Wix%20ON1%20DSC05354-scaled.jpg" \
  "$B/Wix%20ON1%20_7R38337-scaled.jpg" \
  "$B/Wix%20ON1%20_7R37945-scaled.jpg"

echo "── Bryce Canyon ────────────────────────────────────────────"
download bryce-canyon \
  "$B/_7R38900-scaled.jpg" \
  "$B/_7R39047-scaled.jpg" \
  "$B/_7R38965-scaled.jpg" \
  "$B/_7R38930-scaled.jpg" \
  "$B/_7R39041-scaled.jpg" \
  "$B/_7R38899-scaled.jpg" \
  "$B/_7R39022-scaled.jpg" \
  "$B/_7R38914-scaled.jpg" \
  "$B/_7R39053-scaled.jpg" \
  "$B/_7R38958-scaled.jpg" \
  "$B/_7R39150-scaled.jpg" \
  "$B/_7R38912-scaled.jpg" \
  "$B/_7R39086-scaled.jpg" \
  "$B/_7R38928-scaled.jpg" \
  "$B/_7R39057-scaled.jpg" \
  "$B/_7R39059-scaled.jpg" \
  "$B/_7R38925-scaled.jpg" \
  "$B/_7R39167-scaled.jpg" \
  "$B/_7R38993-scaled.jpg" \
  "$B/_7R38915-scaled.jpg"

echo "── Andorra ─────────────────────────────────────────────────"
download andorra \
  "$B/_7R40106-scaled.jpg" \
  "$B/_7R41117-scaled.jpg" \
  "$B/_7R40362-scaled.jpg" \
  "$B/_7R40082-scaled.jpg" \
  "$B/_7R40048-scaled.jpg" \
  "$B/_7R40092-scaled.jpg" \
  "$B/_7R40113-scaled.jpg" \
  "$B/_7R40226-scaled.jpg" \
  "$B/_7R40201-scaled.jpg" \
  "$B/_7R40055-scaled.jpg" \
  "$B/_7R40075-scaled.jpg" \
  "$B/_7R40133-scaled.jpg" \
  "$B/_7R40073-scaled.jpg" \
  "$B/_7R40187-scaled.jpg" \
  "$B/_7R40360-scaled.jpg" \
  "$B/_7R40120-scaled.jpg" \
  "$B/_7R40065-scaled.jpg" \
  "$B/_7R40052-scaled.jpg" \
  "$B/_7R40067-scaled.jpg" \
  "$B/A1_00488-scaled.jpg"

echo "── Roma & Nápoles ──────────────────────────────────────────"
download roma-napoles \
  "$B/A1_06239-scaled.jpg" \
  "$B/A1_06210-scaled.jpg" \
  "$B/A1_06364-scaled.jpg" \
  "$B/A1_06358-scaled.jpg" \
  "$B/A1_06366-scaled.jpg" \
  "$B/A1_06367-scaled.jpg" \
  "$B/A1_06217-scaled.jpg" \
  "$B/A1_06362-scaled.jpg" \
  "$B/A1_06348-scaled.jpg" \
  "$B/A1_06214-scaled.jpg" \
  "$B/A1_06229-scaled.jpg" \
  "$B/A1_06299-scaled.jpg" \
  "$B/A1_06273-scaled.jpg" \
  "$B/A1_06298-scaled.jpg" \
  "$B/A1_06339-scaled.jpg" \
  "$B/A1_06311-scaled.jpg" \
  "$B/A1_06258-scaled.jpg" \
  "$B/A1_06304-scaled.jpg" \
  "$B/A1_06338-scaled.jpg" \
  "$B/A1_06249-scaled.jpg"

echo "── Sagrada Família ─────────────────────────────────────────"
download sagrada-familia \
  "$B/Up%20ON1%20_7R37065-scaled.jpg" \
  "$B/Geometric%207158-scaled.jpg" \
  "$B/_7R37092-scaled.jpg" \
  "$B/Wide%20ON1%20_7R37073%201-scaled.jpg" \
  "$B/symetry%20595-scaled.jpg" \
  "$B/_7R37080-scaled.jpg" \
  "$B/color%207070.jpg" \
  "$B/multiples%20%20043-scaled.jpg" \
  "$B/color%2021-scaled.jpg" \
  "$B/color%20%20045-scaled.jpg" \
  "$B/texture%20%20028-scaled.jpg" \
  "$B/Geometric%207090.jpg" \
  "$B/Wide%20ON1%20_7R37180-scaled.jpg" \
  "$B/Leaves%20ON1%20_7R37128-scaled.jpg" \
  "$B/door%20window%207116-scaled.jpg" \
  "$B/Geometric%207147-scaled.jpg" \
  "$B/best%20%20018-scaled.jpg" \
  "$B/best%20%20025-scaled.jpg" \
  "$B/best%20%20019-scaled.jpg" \
  "$B/best%20%20020-scaled.jpg"

echo "── Lake Powell ─────────────────────────────────────────────"
download lake-powell \
  "$B/_7R39922-scaled.jpg" \
  "$B/_7R39981-scaled.jpg" \
  "$B/_7R39426-scaled.jpg" \
  "$B/_7R39925-scaled.jpg" \
  "$B/_7R39199-scaled.jpg" \
  "$B/_7R39227-scaled.jpg" \
  "$B/_7R39250-scaled.jpg" \
  "$B/_7R39846-scaled.jpg" \
  "$B/_7R39809-scaled.jpg" \
  "$B/_7R39829-scaled.jpg" \
  "$B/_7R39524-scaled.jpg" \
  "$B/_7R39934-scaled.jpg" \
  "$B/_7R39224-scaled.jpg" \
  "$B/_7R39977-scaled.jpg" \
  "$B/_7R39892-scaled.jpg" \
  "$B/_7R39953-scaled.jpg" \
  "$B/_7R39421-scaled.jpg" \
  "$B/_7R39898-scaled.jpg" \
  "$B/_7R39258-scaled.jpg" \
  "$B/_7R39564-scaled.jpg"

echo "── Southwest Parks ─────────────────────────────────────────"
download southwest-parks \
  "$B/_7R38363-scaled.jpg" \
  "$B/_7R38565-scaled.jpg" \
  "$B/_7R38606-scaled.jpg" \
  "$B/_7R38389-scaled.jpg" \
  "$B/_7R38410-scaled.jpg" \
  "$B/_7R38348-scaled.jpg" \
  "$B/_7R38406-scaled.jpg" \
  "$B/_7R38638-scaled.jpg" \
  "$B/_7R38598-scaled.jpg" \
  "$B/_7R38573-scaled.jpg" \
  "$B/_7R38605-scaled.jpg" \
  "$B/_7R38407-scaled.jpg" \
  "$B/_7R38615-scaled.jpg" \
  "$B/_7R38563-scaled.jpg" \
  "$B/_7R38576-scaled.jpg" \
  "$B/_7R38358-scaled.jpg" \
  "$B/_7R38574-scaled.jpg" \
  "$B/_7R38560-scaled.jpg" \
  "$B/_7R38617-scaled.jpg" \
  "$B/_7R38603-scaled.jpg"

echo "── Slow Motion ─────────────────────────────────────────────"
download slow-motion \
  "$B/_7R36825-scaled.jpg" \
  "$B/_7R30844-scaled.jpg" \
  "$B/A1_02076-scaled.jpg" \
  "$B/A1_01231-scaled.jpg" \
  "$B/_7R36371-scaled.jpg" \
  "$B/_7R36832-scaled.jpg" \
  "$B/A1_02048-scaled.jpg" \
  "$B/A1_01233-scaled.jpg" \
  "$B/_7R30884-scaled.jpg" \
  "$B/A1_02075-scaled.jpg" \
  "$B/_7R36370-scaled.jpg" \
  "$B/_7R30842-scaled.jpg" \
  "$B/_7R30843-scaled.jpg" \
  "$B/_7R38158-scaled.jpg" \
  "$B/_7R36834-scaled.jpg" \
  "$B/A1_02072-scaled.jpg" \
  "$B/_7R37972-scaled.jpg" \
  "$B/_7R36265-scaled.jpg" \
  "$B/_7R37971-scaled.jpg" \
  "$B/A1_01042-scaled.jpg"

echo "── Monumental Valley ───────────────────────────────────────"
download monumental-valley \
  "$B/_7R30071-scaled.jpg" \
  "$B/_7R30104-scaled.jpg" \
  "$B/_7R30339-scaled.jpg" \
  "$B/_7R30077-scaled.jpg" \
  "$B/_7R30103-scaled.jpg" \
  "$B/_7R30300-scaled.jpg" \
  "$B/_7R30089-scaled.jpg" \
  "$B/_7R30303-scaled.jpg" \
  "$B/_7R30006-scaled.jpg" \
  "$B/_7R30204-scaled.jpg" \
  "$B/_7R30210-scaled.jpg" \
  "$B/_7R30364-scaled.jpg" \
  "$B/_7R30198-scaled.jpg" \
  "$B/_7R30173-scaled.jpg" \
  "$B/_7R30213-scaled.jpg" \
  "$B/_7R30207-scaled.jpg" \
  "$B/_7R30171-scaled.jpg" \
  "$B/_7R30170-scaled.jpg" \
  "$B/_7R30216-scaled.jpg" \
  "$B/_7R30174-scaled.jpg"

echo ""
echo "✅ Descarga 2 completada. Archivos en $BASE"
