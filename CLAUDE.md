# Francisco Cornellana Photography — Portfolio Website

## Project overview

Single-file static photography portfolio (`index.html`) for Francisco Cornellana, a travel and wildlife photographer based in the UK. No build tools, no frameworks, no external dependencies beyond Google Fonts. Everything lives in one self-contained HTML file.

The site is opened directly from the filesystem via `file://` in Safari or Chrome. Because of this, local images are referenced with a relative path two levels up (`../../Pictures/Portfolio/[category]/NN.jpg`). Safari may require **Develop → Disable Cross-Origin Restrictions** (or equivalent) to load local images.

---

## Adding a new gallery — step-by-step workflow

This is the routine to add any new event or location gallery to the site.

### Step 1 — Drop photos into a new folder

Create a subfolder inside `~/Pictures/Portfolio/` with a lowercase, hyphenated key name that will identify the gallery permanently (e.g. `rodeo-2025`, `jazz-festival`, `sierra-nevada`).

Copy all photos into that folder. Names at this point can be anything (original camera names are fine).

### Step 2 — Rename photos to sequential format

The gallery loader expects files named `01.jpg`, `02.jpg`, `03.jpg` … Run:

```bash
cd ~/Downloads/Mi\ Pagina\ Web
./rename_photos.sh <folder-name>
```

For example:
```bash
./rename_photos.sh rodeo-2025
```

The script sorts all JPG/JPEG files alphabetically (which preserves chronological camera order) and renames them in two passes to avoid conflicts. Output confirms each rename. Photos can now be opened locally by the gallery.

### Step 3 — Tell Claude to add the gallery

Tell me:
- **Folder key** (must match the folder name exactly, e.g. `rodeo-2025`)
- **Display name** in English (e.g. `Rodeo 2025`)
- **Filter category**: `america` · `europa` · `mundo` · `naturaleza` · `eventos`

Optionally:
- Which photo number to use as cover thumbnail (default: `01`)
- A Wikipedia or external link for "Learn more"

Claude will then:
1. Add one line to `GALLERY_UI` in `index.html`
2. Add the full `GALLERY_META` entry with descriptions in EN/CA/ES
3. Add the `item_*` translation keys to `TRANSLATIONS` if the name differs between languages
4. **Extract GPS coordinates** from EXIF metadata of every photo in the folder using `exiftool`
5. **Reverse-geocode** each unique coordinate cluster via Nominatim (OpenStreetMap, 1 req/sec) to obtain place names
6. Add a `GALLERY_LOCATIONS['folder-key']` entry to `index.html` mapping each photo (`'01'`, `'02'`…) to its location string
7. Commit and push to GitHub

The location label appears in the lightbox (white text, gold marker, bottom-centre) whenever a photo has GPS data. Galleries without GPS simply show no label.

### What Claude does NOT need from you

- No manual HTML editing
- No count of photos (the gallery probes the folder automatically)
- No renaming of photos beyond running `rename_photos.sh`
- No GPS data — Claude reads it automatically from the photo EXIF metadata

### GPS location workflow detail

```bash
# 1. Extract decimal GPS for all photos in order (alphabetical = same as rename script)
exiftool -csv -n -GPSLatitude -GPSLongitude ~/Pictures/Portfolio/<key>/*.jpg

# 2. Cluster photos within ~0.05° of each other → one Nominatim call per cluster
curl -s "https://nominatim.openstreetmap.org/reverse?lat=LAT&lon=LON&format=json&zoom=16&accept-language=en" \
  -H "User-Agent: FranciscoCornellanaPortfolio/1.0"
# Extract: tourism > natural > waterway > leisure > peak > village > first word of display_name

# 3. Add to GALLERY_LOCATIONS in index.html:
const GALLERY_LOCATIONS = {
  'gallery-key': {
    '01': 'Place Name, Region',
    '02': 'Place Name, Region',
    ...
  }
};
```

Photos without GPS (studio shots, events) are simply omitted from `GALLERY_LOCATIONS` — no label shows in the lightbox for those photos.

---

## Design system

Dark minimalist aesthetic. All variables live in `:root`:

```css
--black:  #090909   /* page background */
--dark:   #0f0f0f   /* alternate section background */
--card:   #141414   /* portfolio cards */
--border: #1e1e1e   /* dividers */
--text:   #e6e6e6   /* body text */
--muted:  #666      /* secondary text */
--gold:   #b8985a   /* accent — category labels, active states, rule lines */
```

Fonts: **Playfair Display** (serif — titles, hero, year cards) + **Inter 300** (sans — body, labels, nav).

---

## File structure

```
Mi Pagina Web/
  index.html              ← entire site (HTML + CSS + JS inline)
  logo.png                ← White-on-Transparent.png downloaded from cornellana.online
  descargar_fotos.sh      ← downloads the first 19 gallery categories (20 photos each)
  descargar_fotos2.sh     ← downloads the remaining 9 gallery categories (20 photos each)
  descarga.log            ← output log from first script
  descarga2.log           ← output log from second script

~/Pictures/Portfolio/     ← local photo library (28 subdirectories × 20 JPEGs each)
  alaska/                 01.jpg … 20.jpg
  hawaii/
  yellowstone/
  yosemite/
  grand-canyon/
  arches/
  bryce-canyon/
  patagonia/
  lofoten/
  dolomitas/
  roma-napoles/
  sagrada-familia/
  andorra/
  japon/
  kenia/
  marruecos/
  macro/
  drones/
  aves/
  flores/
  mamiferos/
  wings-over-wayne/
  slow-motion/
  monumental-valley/      (also used for the Zion portfolio item)
  southwest-parks/
  lake-powell/
  danza/
  rodeo/
```

---

## How the gallery system works

All portfolio items have a `data-gallery="[key]"` attribute. A click listener on `#portfolioGrid` intercepts clicks: if the item has `data-gallery`, it calls `openGallery(key)` and prevents the default `href` navigation. Items without `data-gallery` fall through to the `href` and open cornellana.online in a new tab.

`GALLERY_META` in the JS maps each key to:
- `name`, `cat` — display name and category label (English)
- `catKey` — snake_case key used to look up the translated category in `TRANSLATIONS` (e.g. `'north_america'` → `cat_north_america`)
- `desc` — object `{ en, ca, es }` with a 3–5 sentence description per language
- `link` — Wikipedia URL or authoritative external link

`GALLERY_UI` is a separate compact object (one line per gallery) with:
- `filter` — portfolio filter category: `america|europa|mundo|naturaleza|eventos`
- `cover` — remote cover image filename (used on GitHub Pages; local uses `01.jpg`)
- `page` — cornellana.online page_id for the fallback link (optional)
- `nameKey` — translation key for galleries with a translated name (optional)

The portfolio grid is built entirely in JS by `buildPortfolioGrid()` from these two objects. No HTML items are hardcoded — adding a new gallery only requires entries in `GALLERY_META` and `GALLERY_UI`.

`imgPath(key, n)` builds the relative path `../../Pictures/Portfolio/[key]/NN.jpg` where `NN` is zero-padded (01, 02 … 20).

The gallery modal shows description + link in the header. Clicking a thumbnail opens the lightbox; ←/→ arrow keys and the nav buttons navigate between images; `Escape` closes.

---

## Multi-language system (CA / ES / EN)

The site supports three languages: **Catalan (CA)**, **Castilian/Spanish (ES)**, and **English (EN)**. The language selector appears in the navigation bar (desktop: inline after the nav links; mobile: inside the fullscreen hamburger overlay).

### How it works

- `let currentLang` — tracks the active language; initialised from `localStorage.getItem('lang')`, defaulting to `'en'`.
- `const TRANSLATIONS` — a single JS object with keys `en`, `ca`, `es`. Each sub-object maps translation keys to the localised string. Keys follow the pattern: `nav_*` (nav links), `hero_*`, `port_*`, `f_*` (filter buttons), `cat_*` (category labels), `item_*` (portfolio item names), `cal_*`, `bio_*`, `gear_*`, `lic_*`, `cont_*`, `footer_*`, `gal_*`.
- `function setLang(lang)` — updates `currentLang`, saves to `localStorage`, sets `document.documentElement.lang`, then replaces `textContent` on every `[data-i18n]` element and `innerHTML` on every `[data-i18n-html]` element. Also updates `.lang-btn.active` CSS class.
- `setLang(currentLang)` is called once at the end of the `<script>` block to apply the stored language on page load.

### Attribute conventions

| Attribute | Used when | JS handler |
|-----------|-----------|------------|
| `data-i18n="key"` | Plain text, no HTML tags | `el.textContent = T[key]` |
| `data-i18n-html="key"` | Contains `<br>`, `<em>`, `<strong>` | `el.innerHTML = T[key]` |

### Adding or editing translations

1. Add the new string under all three language keys in `TRANSLATIONS`.
2. Add `data-i18n="key"` (or `data-i18n-html="key"`) to the HTML element.
3. No build step needed — `setLang()` will pick it up automatically.

### Gallery descriptions

`GALLERY_META[key].desc` is now an object `{ en: '...', ca: '...', es: '...' }` for all 28 galleries. `openGallery()` reads `meta.desc[currentLang]` (falling back to `meta.desc.en`). `meta.catKey` (e.g. `'north_america'`) is used to look up `TRANSLATIONS[currentLang]['cat_' + meta.catKey]`.

### Hero location badge

`showLocation()` translates the slide `cat` field via an inline `catKeyMap` object mapping English category names to their translation keys.

---

## Hero slideshow

Two-layer CSS crossfade (slideA/slideB elements with `opacity` transition). Each slide entry in `SLIDES[]` includes a `gallery` property mapping it to the local gallery key. Clicking anywhere on the hero (excluding the dot navigation) calls `heroClick()`, which opens the gallery for the currently visible slide.

A dark gradient (`#home::before`) ensures nav links are always legible regardless of the slide image content.

---

## Site sections

| Section ID    | Content |
|---------------|---------|
| `#home`       | Full-viewport hero slideshow, 10 slides, clickable |
| `#portfolio`  | Filterable grid (All / Americas / Europe / World / Nature / Events), 28 items |
| `#calendar`   | Three year-archive cards (2022–2024) linking to cornellana.online |
| `#biography`  | Photographer profile with 4 detailed paragraphs + portrait photo |
| `#gear`       | Full equipment list (Sony A7R IV, Sony A1, lenses, DJI drone, support) |
| `#licenses`   | Three license tier cards (Personal / Editorial / Commercial) |
| `#contact`    | Phone, email, social links |

---

## UI sizing decisions (last updated 2026-06)

- **Logo** (`logo.png`): `height: 54px` in the nav — large enough to be clearly legible at both desktop and mobile sizes, with `drop-shadow` for contrast on light slides.
- **Hero title**: `clamp(3.8rem, 9vw, 8rem)` — deliberately large; the hero is full-viewport and the title needs to command the bottom-left of the frame.
- **Hero subtitle**: `1.2rem` / `line-height: 1.8` — readable over the dark bottom gradient.
- **Gallery description text**: `0.95rem` / `line-height: 1.8` — comfortable reading size for 3–5 sentence descriptions in the modal header.
- **Gallery descriptions**: 3–5 sentences, written to genuinely inform. They cover geography, photographic significance, best conditions, and what makes the location distinctive. Not marketing copy.

---

# iPhone & iPad (mobile)

The site is designed to look and feel as polished on a phone as on a 27-inch desktop monitor. Every layout decision uses responsive techniques, not fixed pixel widths.

## How to test on iPhone (without a real device)

### Option A — Safari Responsive Design Mode (recommended)

This is the best local option: loads the `file://` page including all local photos.

1. Open `index.html` in Safari on Mac.
2. Make sure the **Develop** menu is visible — if not: Safari → Settings → Advanced → tick *Show features for web developers*.
3. Press **⌥⌘R** (Option + Cmd + R) to enter Responsive Design Mode.
4. In the device bar at the top, select the iPhone model to simulate (e.g. iPhone 16 Pro).
5. The page renders at the exact iPhone viewport size. Local photos load correctly.

> If photos don't appear, go to **Develop → Disable Cross-Origin Restrictions**.

### Option B — Xcode iOS Simulator

Shows the real Safari app on a simulated iPhone, but **local `file://` photos will not load** (simulator Safari is sandboxed). Useful to verify layout and interactions, not photo display.

```bash
# Launch the simulator from Terminal
open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app

# Or boot a specific device and open the page in its Safari
xcrun simctl boot 2EBAD34E-A98C-4401-B9E3-DBFDC7ABA323   # iPhone 17 Pro
xcrun simctl openurl booted "file:///Users/Francisco_1/Downloads/Mi%20Pagina%20Web/index.html" &
```

To list available simulators: `xcrun simctl list devices available | grep -i iphone`

---

## What adapts below 860 px (tablet and phone)

- Nav collapses to a hamburger menu. The mobile nav opens as a full-screen overlay (`position: fixed; inset: 0`) with centred links, preventing any scroll or interaction bleed.
- The hero `padding` shrinks to `0 1.5rem 8rem` — enough breathing room on a 375px iPhone.
- The biography section switches from a two-column grid to a single column; the portrait photo moves above the text (`order: -1`) so the reader sees the face immediately.
- The year-archive row (`#calendar`) stacks vertically, one card per row.
- The contact section stacks to a single column.
- Footer centres and stacks.
- Gallery header description shows as a **3-line clamp** (`-webkit-line-clamp: 3`) instead of the full paragraph, to leave room for the photo grid.

## What adapts below 520 px (small phones)

- Portfolio grid forces two columns (previously auto-fill with 260 px minimum).
- Filter bar expands to full width with equal-width buttons.
- Gallery grid thumbnails go to two columns.

## Typography

All font sizes use `clamp()` or unitless `rem` values — they scale with the user's browser font-size preference and respect Dynamic Type / system accessibility font sizes.

## Touch targets

All interactive elements (nav links, filter buttons, dot navigation, gallery thumbnails, lightbox controls) meet or exceed 44×44 px touch targets per Apple HIG guidelines.

## Known mobile quirks and fixes applied

| Problem | Cause | Fix applied |
|---------|-------|-------------|
| Hero slideshow didn't fill the full viewport height | `100svh` not always computed correctly in Safari iOS | Changed to `height: 100vh; height: 100dvh` (dvh = dynamic viewport height, adjusts as browser chrome shows/hides) |
| Gallery description invisible on mobile | `display: none` was set explicitly at ≤860 px | Replaced with 3-line clamp so the description is visible but compact |
| Gallery photo grid overlapped instead of scrolling | Safari doesn't scroll a `display:grid` element that is also the `overflow-y:auto` flex child | Wrapped grid in a separate `.gal-grid-scroll` div (scroll container) so the grid itself can grow freely |

## Testing checklist

1. Open `index.html` in Safari → Responsive Design Mode → iPhone 16 Pro.
2. Hero fills the full screen (no black bars, no overflow).
3. Nav hamburger opens as full-screen overlay; language selector visible inside it.
4. Portfolio grid is 2-column on small phones.
5. Opening a gallery: description shows (3 lines); photo grid scrolls; thumbnails are 2-column.
6. Lightbox: image fills viewport; prev/next arrows work; location label visible on photos with GPS.
7. Rotate to landscape — hero, portfolio, and gallery still look correct.
8. Test on iPad (mini and Pro) in both orientations — biography two-column layout should remain at ≥860 px breakpoint on iPad landscape.

---

# GitHub

The project's photo assets live in `~/Pictures/Portfolio/` (outside the repo — they are large binary files and should not be committed). Only source code and scripts belong in version control.

**Repository:** `cornellana/mi-pagina-web` (or equivalent public repo on the `cornellana` GitHub account).

**What to commit:**
```
index.html              ← always commit after any content or style change
logo.png                ← commit once (rarely changes)
descargar_fotos.sh      ← commit so the download process is reproducible
descargar_fotos2.sh     ← commit so the download process is reproducible
CLAUDE.md               ← commit every time it is updated
```

**What NOT to commit:**
```
descarga.log / descarga2.log    ← ephemeral output, ignore
~/Pictures/Portfolio/           ← binary files, too large, outside repo anyway
.DS_Store                       ← always in .gitignore
```

**Recommended `.gitignore`:**
```gitignore
.DS_Store
*.log
```

**Workflow after any change to `index.html`:**
```bash
git add index.html CLAUDE.md
git commit -m "Brief description of what changed"
git push origin main
```

**GitHub Pages (optional but recommended):** This site works perfectly as a GitHub Pages site. Enable it in repo Settings → Pages → branch `main`, folder `/` (root). The site will be live at `https://cornellana.github.io/[repo-name]/`. Note: GitHub Pages serves the site over HTTPS with a `https://` origin — the local photo paths (`../../Pictures/Portfolio/...`) will not resolve. For GitHub Pages deployment, gallery images must be served from remote URLs (e.g., raw.githubusercontent.com or cornellana.online). Keep this in mind before enabling Pages.

**Branching:** Given the solo nature of this project, working directly on `main` is fine. Create a feature branch only when experimenting with a significant redesign that might need to be discarded.

**Push frequently:** After each meaningful session, `git add`, `git commit`, `git push`. Never let more than a day of work accumulate uncommitted.
