#!/usr/bin/env bash
# Download the pretrained IRENE checkpoint (CRPS ensemble, non-GAN) from HuggingFace Hub.
set -euo pipefail

REPO_ID="it4lia/irene"
FILENAME="model.ckpt"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_DIR="${SCRIPT_DIR}/../checkpoints"
DEST_PATH="${DEST_DIR}/${FILENAME}"
URL="https://huggingface.co/${REPO_ID}/resolve/main/${FILENAME}"

mkdir -p "${DEST_DIR}"

if [ -f "${DEST_PATH}" ]; then
    echo "Checkpoint already present at ${DEST_PATH}, skipping download."
    exit 0
fi

echo "Downloading ${REPO_ID}/${FILENAME} (~735 MiB) to ${DEST_PATH} ..."
curl -L --fail --progress-bar -o "${DEST_PATH}.part" "${URL}"
mv "${DEST_PATH}.part" "${DEST_PATH}"
echo "Done: ${DEST_PATH}"
