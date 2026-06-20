# Procedimiento — Actualizar una galería del portfolio (fotos + GPS + index.html)

Runbook reutilizable. Sigue estos pasos cada vez que cargues fotos nuevas en
una carpeta de `Pictures/Portfolio/<galeria>/`.

---

## 0. Requisitos previos (una sola vez)

- Tener `rename_photos.sh` y `extract_gps.sh` guardados en algún sitio accesible
  (p. ej. `~/Scripts/`). Son genéricos: detectan solos el nombre de la galería
  a partir del nombre de la carpeta donde se ejecutan. No hay que editarlos.
- macOS con `mdls` disponible (viene de fábrica, no requiere instalar nada).
- Acceso SMB al NAS (`smb://192.168.1.66`) o el túnel WireGuard activo si estás
  fuera de casa.

---

## 1. Preparar la carpeta de fotos en local

1. Ten las fotos nuevas en una carpeta en tu Mac, p. ej. `~/Downloads/<galeria>/`.
   El nombre de esta carpeta debe coincidir con la **key** de la galería en el
   `index.html` (ej. `kenia`, `crucero-paises-bajos`) — los scripts usan ese
   nombre automáticamente para generar el CSV.
2. Copia `rename_photos.sh` y `extract_gps.sh` dentro de esa carpeta:
   ```bash
   cp ~/Scripts/rename_photos.sh ~/Scripts/extract_gps.sh ~/Downloads/<galeria>/
   ```

---

## 2. Renombrar cronológicamente

```bash
cd ~/Downloads/<galeria>
chmod +x rename_photos.sh extract_gps.sh
./rename_photos.sh
```

Qué hace: lee la fecha real de captura (EXIF, vía `mdls`) de cada foto y las
renombra a `01.jpg`, `02.jpg`, `03.jpg`... en orden cronológico real. Esto es
importante si usas más de un cuerpo de cámara (la numeración de archivo de
cada cámara es independiente, así que ordenar por nombre de archivo mezclaría
mal las fotos). El padding a 2 dígitos no es un límite — si hay más de 99
fotos, sigue funcionando igual (`100.jpg`, `101.jpg`...).

---

## 3. Extraer las coordenadas GPS

```bash
./extract_gps.sh
```

Genera `~/Downloads/<galeria>_gps.csv` — un fichero de texto pequeño, sin
fotos, con columnas `filename,lat,lon`. Las fotos sin GPS (raro, pero pasa si
falló el GPS de la cámara en algún momento) quedan con lat/lon vacíos; eso es
normal y se gestiona en el siguiente paso.

---

## 4. Pasarle el CSV a Claude

En el chat, simplemente dile:

> "ya está generado el csv de `<galeria>`"

Claude lo leerá directamente (es un fichero de texto, no necesita que se lo
copies pegado). A partir de ahí, Claude:

1. Ordena las fotos numéricamente (el CSV sale en orden alfabético, no
   numérico — 1, 10, 100, 11... — así que esto es necesario).
2. Agrupa las coordenadas en clusters geográficos.
3. Identifica el nombre real de cada lugar (vía conocimiento geográfico o
   búsqueda web si hace falta).
4. Rellena los huecos sin GPS con la ubicación del vecino más cercano en la
   secuencia (asume que es la misma zona, ya que las fotos van en orden
   cronológico).
5. Si algún cluster no se puede identificar con confianza, lo marca
   explícitamente como "(a confirmar)" en vez de inventar un lugar — avisa
   si ves esa etiqueta y dile el nombre real si lo sabes.

---

## 5. Qué actualiza Claude en el `index.html`

Dependiendo de si la galería ya existía o es nueva:

**Si la galería ya existe** (solo se han añadido/sustituido fotos):
- Actualiza `count` en `GALLERY_META['<galeria>']` al nuevo número total de fotos.
- Añade o sustituye el bloque `GALLERY_LOCATIONS['<galeria>']` con las
  localizaciones nuevas.

**Si es una galería nueva** (no existía antes en la web), dilo explícitamente
("esta es una galería nueva, hay que añadirla") y Claude además:
- Añade una entrada nueva en `GALLERY_META` con `name`, `cat`, `catKey`,
  `count`, `link` y `desc` (en los 3 idiomas: en/ca/es).
- Añade una entrada nueva en `GALLERY_UI` con `filter` (america|europa|mundo|
  naturaleza|eventos), `cover` (vacío si es local), `page` (null si no aplica)
  y opcionalmente `nameKey` si quieres que el nombre se traduzca por idioma.
- Opcionalmente, la añade también a `SLIDES` si quieres que aparezca en el
  hero rotatorio de la portada.

Claude valida el JavaScript resultante con `node --check` antes de darte el
archivo, para asegurar que no se ha roto la sintaxis.

---

## 6. Descargar el `index.html` actualizado

Claude lo escribe directamente en `~/Downloads/index.html` en tu Mac (no hace
falta que lo abras ni lo descargues manualmente desde un enlace).

---

## 7. Subir todo al NAS

Por Finder (`Cmd+K` → `smb://192.168.1.66`) o por WireGuard si estás fuera:

1. Copia la carpeta de fotos renombradas (`~/Downloads/<galeria>/`, sin los
   ficheros `.sh`) a `Pictures/Portfolio/<galeria>/` en el NAS, sustituyendo
   el contenido anterior si ya existía.
2. Sustituye `index.html` en la raíz del share `Web` del NAS por el nuevo de
   `~/Downloads/index.html`.

**Importante:** sube los dos a la vez. Si solo subes uno de los dos, el
portfolio entero deja de funcionar (no solo esa galería), porque todas las
galerías comparten el mismo `index.html`.

---

## 8. Verificar

Abre `https://cornellanas.net` (o `http://192.168.1.66` en local) y entra en
la galería actualizada. Confirma que:
- Aparecen todas las fotos nuevas.
- Las localizaciones se muestran correctamente en el lightbox al pasar por
  las fotos.

---

## 9. Sincronizar con el repositorio Git local / GitHub

Una vez confirmado que funciona en el NAS, actualiza tu copia local que ya
está conectada a GitHub:

```bash
cd "/Users/Francisco_1/Library/Mobile Documents/com~apple~CloudDocs/Mio/Aplicaciones IA/Mi Pagina Web"

# Copia ahí el index.html nuevo y la carpeta de fotos renombrada,
# sustituyendo lo anterior si ya existía esa galería

git add .
git commit -m "Actualizar galeria <galeria>: N fotos, localizaciones GPS"
git push
```

Si `git push` pide credenciales o da error de rama, comprueba primero con
`git status` y `git branch` en qué rama estás antes de forzar nada.

---

## Notas y errores típicos

- **No envíes zips ni carpetas comprimidas a Claude** — la transferencia de
  ficheros grandes (>~50 MB) entre tu Mac y el entorno de Claude falla por
  timeout. El método que sí funciona siempre es: scripts corren en tu Mac,
  solo el CSV de texto (pequeño) llega a Claude.
- **Nombres de carpeta con espacios o mayúsculas inconsistentes** rompen el
  enlace entre el nombre de carpeta y la `key` usada en `index.html` — usa
  siempre minúsculas y guiones, igual que las claves ya existentes
  (`crucero-paises-bajos`, `islas-feroes`, etc.).
- **Fotos sin EXIF de fecha** (capturas de pantalla, exportaciones raras):
  `rename_photos.sh` cae automáticamente a la fecha de modificación del
  archivo si no hay EXIF — revisa el orden resultante si tienes fotos así
  mezcladas con fotos de cámara real.
