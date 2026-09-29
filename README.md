# DBI Referat: Data Modeling

Dieses Quarto-Projekt enthält ein **Reveal.js-Referat** zum Thema **Data Modeling** für den DBI-Unterricht. Die Folien enthalten kurze Stichpunkte, während ausführliche Erläuterungen in den Speaker Notes hinterlegt sind.

## Struktur

- `_quarto.yml` – Projektkonfiguration (Reveal.js + PDF)
- `index.qmd` – Gesamte Präsentation mit PlantUML-Diagrammen
- `flake.nix` – Nix-Flake mit Quarto, Python, PlantUML und LaTeX
- `.envrc` – direnv-Konfiguration für `nix develop`
- `requirements.txt` – Python-Pakete
- `_extensions/pandoc-ext/diagram/` – Quarto-Filter für PlantUML

## Verwendung

Mit installiertem [Nix](https://nixos.org/download.html) (und aktivierten Flakes):

```bash
# Entwicklungsumgebung betreten
nix develop

# Reveal.js und PDF rendern
quarto render

# Nur Reveal.js
quarto render --to revealjs

# Nur PDF
quarto render --to pdf

# Live-Vorschau
quarto preview
```

Wenn [direnv](https://direnv.net/) installiert ist, wird die Umgebung automatisch beim Betreten des Ordners aktiviert.

## Automatische Veröffentlichung auf GitHub Pages

Der Workflow `.github/workflows/publish.yml` baut bei jedem Push auf `main` (oder `master`) die Reveal.js-Präsentation sowie ein PDF und veröffentlicht beides auf GitHub Pages.

Das PDF ist anschließend unter `https://<username>.github.io/<repo-name>/referat.pdf` erreichbar.

Voraussetzungen im Repository:

1. **Settings → Pages → Build and deployment** auf **GitHub Actions** umstellen.
2. **Settings → Actions → General → Workflow permissions** auf **Read and write permissions** stellen.

## Hinweis

Die Flake enthält einen Workaround für [NixOS/nixpkgs#519484](https://github.com/NixOS/nixpkgs/issues/519484), damit Quarto in der aktuellen nixpkgs-Version korrekt rendert.
