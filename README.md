# Francisco Cornellana Photography

Portfolio web personal de **Francisco Cornellana**, fotógrafo de viajes, naturaleza y eventos basado en Andorra. La web muestra galerías de fotografía organizadas por categoría, con soporte completo para tres idiomas (inglés, castellano y catalán) y diseño adaptado a móvil, tablet y escritorio.

🌐 **Web en línea:** [cornellana.github.io/mi-pagina-web](https://cornellana.github.io/mi-pagina-web/)

---

## Características

- **Galería de portfolio** con filtros por categoría: Américas · Europa · Mundo · Naturaleza · Eventos
- **Galerías de imágenes** con lightbox, navegación por teclado y gestos táctiles
- **Tres idiomas** (EN / ES / CA) con selector en la navegación, persistido en el navegador
- **Slideshow** en la portada con 10 imágenes y enlace directo a la galería correspondiente
- **Secciones**: Portfolio · Por año · Biografía · Equipamiento · Licencias · Contacto
- **Sin dependencias** — un único fichero `index.html` con todo el HTML, CSS y JavaScript incluidos

---

## Estructura de ficheros

```
Mi Pagina Web/
├── index.html              ← toda la web (HTML + CSS + JS en un solo fichero)
├── logo.png                ← logotipo blanco sobre transparente
├── rename_photos.sh        ← renombra las fotos de una carpeta nueva al formato secuencial
├── descargar_fotos.sh      ← descargó las primeras 19 galerías desde cornellana.online
├── descargar_fotos2.sh     ← descargó las 9 galerías restantes
└── CLAUDE.md               ← instrucciones técnicas para Claude Code

~/Pictures/Portfolio/       ← fotos locales (fuera del repositorio — no se suben a GitHub)
├── alaska/                 01.jpg … N.jpg
├── hawaii/
├── yellowstone/
├── rodeo/
└── …                       (28 carpetas en total)
```

> Las fotos viven en `~/Pictures/Portfolio/` y **no forman parte del repositorio** — son archivos binarios grandes. Solo el código fuente se sube a GitHub.

---

## Ver la web en local

1. Abre `index.html` directamente en Safari o Chrome (`Archivo → Abrir…` o arrastra al navegador)
2. En Safari, activa **Desarrollo → Desactivar restricciones de origen cruzado** para que carguen las fotos locales
3. La web detecta automáticamente si se abre como `file://` (fotos locales) o desde un servidor (fotos remotas)

---

## Añadir una nueva galería de eventos

Este es el proceso completo para incorporar un nuevo evento al portfolio. No hace falta tocar HTML ni JavaScript manualmente.

### Paso 1 — Crear la carpeta y copiar las fotos

Crea una carpeta dentro de `~/Pictures/Portfolio/` con un nombre en minúsculas y guiones que identifique la galería de forma permanente. Este nombre es la **clave** de la galería y no se puede cambiar después sin actualizar el código.

```
Ejemplos válidos:
  rodeo-2025
  jazz-festival-london
  rally-wales
  sierra-nevada-2026
```

Copia todas las fotos del evento dentro de esa carpeta. Los nombres originales de la cámara son perfectamente válidos en este punto — el paso siguiente los reorganizará.

```bash
# Ejemplo: crear la carpeta y copiar fotos
mkdir ~/Pictures/Portfolio/rodeo-2025
cp /Volumes/TarjetaSD/DCIM/*.jpg ~/Pictures/Portfolio/rodeo-2025/
```

---

### Paso 2 — Renombrar las fotos al formato secuencial

La galería carga las fotos por nombre: `01.jpg`, `02.jpg`, `03.jpg`… El script `rename_photos.sh` hace esta conversión automáticamente.

```bash
cd ~/Downloads/Mi\ Pagina\ Web
./rename_photos.sh rodeo-2025
```

**Qué hace el script:**
- Encuentra todos los ficheros `.jpg` / `.jpeg` (insensible a mayúsculas) dentro de la carpeta
- Los ordena alfabéticamente — esto preserva el orden cronológico de las cámaras Sony/Canon/Nikon (cuyos nombres de fichero son secuenciales)
- Los renombra en **dos pasadas** para evitar conflictos: primero a nombres temporales, luego al formato final
- Muestra en pantalla cada renombrado

**Salida esperada:**
```
Found 47 photos in rodeo-2025 — renaming...
  → 01.jpg
  → 02.jpg
  …
  → 47.jpg

✅  47 photos renamed in ~/Pictures/Portfolio/rodeo-2025
    Ready to add to the website.
```

Puedes comprobar el resultado:
```bash
ls ~/Pictures/Portfolio/rodeo-2025/
# 01.jpg  02.jpg  03.jpg  …  47.jpg
```

> Si añades más fotos a una galería ya existente, pon los nuevos ficheros en la carpeta con cualquier nombre y vuelve a ejecutar el script — renombrará todo desde cero en el orden correcto.

---

### Paso 3 — Pedir a Claude que incorpore la galería

Abre Claude Code y escribe algo como:

> *"Añade la galería `rodeo-2025`, nombre 'Rodeo 2025', categoría eventos"*

Proporciona como mínimo:

| Campo | Descripción | Ejemplo |
|-------|-------------|---------|
| **Clave** | Nombre exacto de la carpeta | `rodeo-2025` |
| **Nombre** | Cómo aparece en el portfolio | `Rodeo 2025` |
| **Categoría** | Filtro del portfolio | `eventos` |

Categorías disponibles: `america` · `europa` · `mundo` · `naturaleza` · `eventos`

Opcionalmente puedes indicar:
- Número de foto para la miniatura de portada (por defecto: `01`)
- Enlace externo para "Saber más" (Wikipedia u otro)
- Descripciones propias en inglés, castellano y catalán (si no, Claude las redacta)

**Lo que hace Claude automáticamente:**

1. Añade una línea a `GALLERY_UI` en `index.html` con la categoría, portada y URL de página
2. Añade la entrada completa a `GALLERY_META` con nombre, categoría y descripciones en los tres idiomas
3. Añade las claves de traducción a `TRANSLATIONS` si el nombre varía entre idiomas
4. Hace commit y push a GitHub

La galería aparece inmediatamente en el portfolio al recargar la página — **no hay HTML que tocar**.

---

### Resultado

- La card del portfolio aparece automáticamente en la categoría correcta
- El filtro funciona sin cambios adicionales
- La galería carga todas las fotos de la carpeta (sin límite fijo — detecta cuántas hay)
- Las descripciones están disponibles en los tres idiomas
- La web en GitHub Pages se actualiza en unos segundos tras el push

---

## Despliegue en GitHub Pages

La web está publicada automáticamente desde la rama `main` en GitHub Pages.

```bash
git add index.html
git commit -m "Add rodeo-2025 gallery"
git push origin main
# La web en línea se actualiza en ~30 segundos
```

> **Nota:** En GitHub Pages las fotos se sirven desde `cornellana.online`, no desde el disco local. Las galerías nuevas que aún no estén en `cornellana.online` mostrarán las cards del portfolio pero las fotos no cargarán en la versión en línea hasta que se suban allí.

---

## Tecnología

| | |
|--|--|
| Lenguajes | HTML5, CSS3, JavaScript (vanilla) |
| Fuentes | Google Fonts — Playfair Display + Inter |
| Imágenes locales | `~/Pictures/Portfolio/[galería]/NN.jpg` |
| Imágenes remotas | `cornellana.online/wp-content/uploads/2024/03/` |
| Hosting | GitHub Pages (rama `main`) |
| Build | Ninguno — fichero único sin compilación |

---

## Licencia

© 2026 Francisco Cornellana. Todos los derechos reservados.  
Las imágenes no pueden reproducirse ni distribuirse sin autorización expresa del autor.
