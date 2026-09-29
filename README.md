# DBI Referat: Data Modeling

Dieses Quarto-Projekt enthält das Referat zum Thema **Data Modeling** für den DBI-Unterricht.

## Struktur

- `_quarto.yml` – Projektkonfiguration
- `index.qmd` – Titelseite und Gliederung
- `chapters/*.qmd` – Kapitel des Referats
- `flake.nix` – Nix-Flake mit Quarto, Python und LaTeX
- `.envrc` – direnv-Konfiguration für `nix develop`
- `requirements.txt` – Python-Pakete

## Verwendung

Mit installiertem [Nix](https://nixos.org/download.html) (und aktivierten Flakes):

```bash
# Entwicklungsumgebung betreten
nix develop

# HTML und PDF rendern
quarto render

# Nur HTML
quarto render --to html

# Nur PDF
quarto render --to pdf

# Live-Vorschau
quarto preview
```

Wenn [direnv](https://direnv.net/) installiert ist, wird die Umgebung automatisch beim Betreten des Ordners aktiviert.

## Automatische Veröffentlichung auf GitHub Pages

Der Workflow `.github/workflows/publish.yml` baut die HTML-Version bei jedem Push auf `main` (oder `master`) und veröffentlicht sie auf GitHub Pages.

Voraussetzungen im Repository:

1. **Settings → Pages → Build and deployment** auf **GitHub Actions** umstellen.
2. **Settings → Actions → General → Workflow permissions** auf **Read and write permissions** stellen.

Danach ist das Referat unter `https://<username>.github.io/<repo-name>/` erreichbar.

## Hinweis

Die Flake enthält einen Workaround für [NixOS/nixpkgs#519484](https://github.com/NixOS/nixpkgs/issues/519484), damit Quarto in der aktuellen nixpkgs-Version korrekt rendert.
