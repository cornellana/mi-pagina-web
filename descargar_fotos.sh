#!/usr/bin/env bash
# Descarga 20 fotos por categoría desde cornellana.online
# Las guarda en ~/Pictures/Portfolio/<categoría>/01.jpg ... 20.jpg

set -e
BASE="$HOME/Pictures/Portfolio"

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

echo "── Alaska ──────────────────────────────────────────────────"
download alaska \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC01967-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC02612-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC03248-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC03011-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC03224-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC02830-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC02435-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC01058-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC01788-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC02919-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC01240-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC02184-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC01943-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC02922-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC01455-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC02195-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC02858-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC02890-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC02831-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC02192-scaled.jpg"

echo "── Hawaii ──────────────────────────────────────────────────"
download hawaii \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09532-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09574-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09655-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09184-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09105-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09323-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09143-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC08962-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09255-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09628-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09053-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09755-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09663-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09109-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09631-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09705-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09490-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09205-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09523-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC09581-scaled.jpg"

echo "── Yellowstone ─────────────────────────────────────────────"
download yellowstone \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R39519-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R38820-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R39653-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R39135-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R38969-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R38955-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R38766-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R38809-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC05936-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R38612-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R39693-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R38567-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R39679-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R39889-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R38605-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R38611-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R39080-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R39094-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R38601-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R39537-scaled.jpg"

echo "── Yosemite ────────────────────────────────────────────────"
download yosemite \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36602-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC05116-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36212-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36359-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36198-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36761-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36211-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36238-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36358-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36176-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC05058-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC05110-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36611-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC05107-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36565-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36571-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36217-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36404-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36661-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R36649-scaled.jpg"

echo "── Grand Canyon ────────────────────────────────────────────"
download grand-canyon \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30424-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30403-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30518-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30635-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30494-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30612-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30430-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30458-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30653-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30386-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30642-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30606-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30395-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30510-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30451-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30423-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30483-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30389-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30394-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30517-scaled.jpg"

echo "── Patagonia ───────────────────────────────────────────────"
download patagonia \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R33342-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30844-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R33395-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30851-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R33431-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R33425-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC08235-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R33369-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC08169-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30884-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R33396-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31595-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R33397-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R33340-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DSC08140-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R30675-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R33208-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R33224-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31619-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R33191-scaled.jpg"

echo "── Japón ───────────────────────────────────────────────────"
download japon \
  "https://cornellana.online/wp-content/uploads/2024/03/7R37188-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R37426-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R37559-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R37746-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R37847-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R37975-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R38092-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R38155-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Osaka-ON1-_7R36970-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R37146-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R37286-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R37493-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R37647-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R37798-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R37915-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R38252-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Osaka-ON1-_7R36946-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R37102-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R37263-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/7R37609-scaled.jpg"

echo "── Kenia ───────────────────────────────────────────────────"
download kenia \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_06178-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_07214-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_09192-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05022-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_07243-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_08153-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_06192-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_08668-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_07786-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_07241-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_06789-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_08743-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_08468-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_07399-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_06648-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R42437-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_06946-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_08425-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_07764-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_06504-scaled.jpg"

echo "── Macro ───────────────────────────────────────────────────"
download macro \
  "https://cornellana.online/wp-content/uploads/2024/03/Macro-ON1-Insect-31-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/green-ON1-Macro-ON1-Insect-7-2-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/eye-590-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/macro-558-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Beauty-ON1-_7R36138-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/eyes-579.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Spider_Grande_ON1_Arana_Grande-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Macro-ON1-Detalle-Flor-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Hibiscus-ON1-1-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Spider_ON1_Arana-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Macro-ON1-Insect-14-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/macro-550.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Spider-ON1-Spider-Eyes-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Macro-ON1-Insect-12-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/mushrooms-563-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Macro-ON1-Detalle-Flor-2-scaled-1.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drop-ON1-_7R34197-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/macro-549-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Flower-ON1-flower-107-copy-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Purple-466-scaled.jpg"

echo "── Lofoten ─────────────────────────────────────────────────"
download lofoten \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R36741-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R36967-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R36753-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R37672-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R36750-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R38323-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R36905-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R37813-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R37207-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/reflection%20601-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R38137-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R38319-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R37836-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R38291-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R37809-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R38333-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R36677-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20DSC06053-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Best%20Photo%20ON1%20_7R37167%201-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Lofoten%20ON1%20_7R37816-scaled.jpg"

echo "── Dolomitas ───────────────────────────────────────────────"
download dolomitas \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R40765-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R40575-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R41150-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R40859-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R41076-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R41110-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R40835-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R40823-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R41143-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R40846-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R40873-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R40557-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R40798-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R40869-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R40916-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R40544-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R40608-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R40561-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R41144-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Dolomites%20ON1%20_7R40939-scaled.jpg"

echo "── Marruecos ───────────────────────────────────────────────"
download marruecos \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05334-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05452-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_04770-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05693-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05863-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05122-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05042-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_04837-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05731-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05889-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05645-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05686-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05309-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05492-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_06158-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05323-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_04809-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05295-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_04835-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/A1_05915-scaled.jpg"

echo "── Drones ──────────────────────────────────────────────────"
download drones \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0051-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0181-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0098-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0124-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0156-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0088-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0126-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0142-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0114-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0133-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Autumn%20ON1%20DJI_0255-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0095-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0170-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0042-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0212-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0108-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/DJI_0018-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0149-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0147-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Drone%20ON1%20DJI_0160-scaled.jpg"

echo "── Aves ────────────────────────────────────────────────────"
download aves \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31173-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31312-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Bird%20ON1%20_7R30667-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Bird%20ON1%20_7R35432-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31376-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31452-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Bird%20ON1%20_7R30502-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31193-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31348-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31424-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31417-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31448-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Bird%20ON1%20_7R30115-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Bird%20ON1%20_7R36119-2-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31438-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31275-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31485-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31292-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R38000-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31406-scaled.jpg"

echo "── Flores ──────────────────────────────────────────────────"
download flores \
  "https://cornellana.online/wp-content/uploads/2024/03/Flowers%20ON1%20_7R36891-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Flowers%20ON1%20_7R32675-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Flowers%20ON1%20DSC05973-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Flowers%20ON1%20_7R37700-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Flowers%20ON1%20DSC00750-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Flowers%20ON1%20_7R30557-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Flowers%20ON1%20_7R30548-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Flowers%20ON1%20_7R37689-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Flowers%20ON1%20DSC09307-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R37793-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Flowers%20ON1%20DSC04482-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Flowers%20ON1%20_7R31930-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Flowers%20ON1%20_7R36844-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Flowers%20ON1%20_7R30454-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31175-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Flowers%20ON1%20DSC05971-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31100-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31425-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Flowers%20ON1%20DSC00769-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/_7R31026-scaled.jpg"

echo "── Mamíferos ───────────────────────────────────────────────"
download mamiferos \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20_7R39279-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20DSC05306-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20DSC03011-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20_7R39278-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20_7R35684-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20IMG_3464-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20DSC05880-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20_7R35849-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20DSC03072-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20DSC03107-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20DSC02580-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20_7R31690-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20_7R30567-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20_7R35609-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20ON1%20_7R39192-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20DSC02959-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20DSC03114-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20_7R30629-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20DSC02948-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Mammals%20%20ON1%20_7R38706-scaled.jpg"

echo "── Wings over Wayne ────────────────────────────────────────"
download wings-over-wayne \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20ON1%20_7R34693-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20ON1%20_7R36251-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20%20ON1%20_7R33795-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20ON1%20_7R34862-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20%20ON1%20_7R33807-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20%20ON1%20_7R33740-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20ON1%20_7R34444-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20%20ON1%20_7R33755-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20ON1%20_7R34929-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20%20ON1%20_7R33816-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20ON1%20_7R35428-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20ON1%20_7R36055-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20%20ON1%20_7R33779-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20ON1%20_7R34454-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20ON1%20_7R35762-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20%20ON1%20_7R33988-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20ON1%20_7R35401-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20ON1%20_7R36644-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20ON1%20_7R34641-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/WOW%2019%20ON1%20_7R34480-scaled.jpg"

echo "── Danza ───────────────────────────────────────────────────"
download danza \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4119-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4121-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4122-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4127-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4128-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4129-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4130-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4131-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4132-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4136-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4137-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4139-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4140-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4142-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4144-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4145-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4146-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4147-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4148-SM-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Sony-a7rIV4152-SM-scaled.jpg"

echo "── Rodeo ───────────────────────────────────────────────────"
download rodeo \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20_7R32210-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20DSC08483-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20DSC08497-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20_7R31679-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20_7R32173-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20_7R32365-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20_7R32239-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20_7R32211-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20_7R32159-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20DSC08522-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20_7R32414-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20DSC08481-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20DSC08495-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20_7R32212-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20_7R32010-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20DSC08485-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20DSC08526-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20_7R32362-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20_7R32160-scaled.jpg" \
  "https://cornellana.online/wp-content/uploads/2024/03/Rodeo%20ON1%20DSC08527-scaled.jpg"

echo ""
echo "✅ Descarga completada. Archivos en $BASE"
