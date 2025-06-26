#!/usr/bin/env bash

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INPUT_DIR="$BASE_DIR/../images-raw/preprocessed"
OUTPUT_DIR="$BASE_DIR/../images-raw/segmented"

echo "🔍 Checking dependencies..."

if ! command -v python3 &>/dev/null; then
  echo "❌ Python3 isn't installed." >&2
  exit 1
fi

install_if_missing() {
  pkg="$1"; mod="$2"
  if ! python3 - <<EOF 2>/dev/null
import importlib
exit(0) if importlib.util.find_spec("$mod") else exit(1)
EOF
  then
    echo "➡ Installing Python package: $pkg"
    python3 -m pip install --user "$pkg"
  fi
}

install_if_missing rembg rembg
install_if_missing filetype filetype
install_if_missing onnxruntime onnxruntime
install_if_missing gradio gradio
install_if_missing asyncer asyncer

if ! command -v rembg &>/dev/null; then
  echo "❌ rembg CLI not found—ensure ~/.local/bin is in your PATH." >&2
  echo '▶ Add to shell rc: export PATH="$HOME/.local/bin:$PATH"' >&2
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

processed=0; failed=0
shopt -s nullglob

echo "▶ Beginning segmentation..."

for img in "$INPUT_DIR"/*.{jpg,jpeg,JPG,JPEG}; do
  fname=$(basename "$img")
  out="$OUTPUT_DIR/${fname%.*}.png"
  echo "⏳ Processing $fname..."

  if rembg i -a \
        --alpha-matting \
        --alpha-matting-foreground-threshold 240 \
        --alpha-matting-background-threshold 15 \
        --alpha-matting-erode-size 5 \
        "$img" "$out"; then
    echo "✔️ Segmented: $fname"
    ((processed++))
  else
    echo "✖️ Failed: $fname" >&2
    ((failed++))
  fi
done

echo
echo "✅ Completed: $processed succeeded, $failed failed."
echo "📂 Segmented outputs in: $OUTPUT_DIR"

# chmod +x ./src/segment_nudibranchs.sh
# ./src/segment_nudibranchs.sh