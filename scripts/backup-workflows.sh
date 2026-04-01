#!/bin/bash
# Exports all n8n workflows to the backups/ folder
# Run: bash scripts/backup-workflows.sh

DATE=$(date +%Y-%m-%d_%H-%M)
BACKUP_DIR="./backups/$DATE"

mkdir -p "$BACKUP_DIR"

docker exec phone-repair-n8n n8n export:workflow \
  --all \
  --output="$BACKUP_DIR/workflows.json"

echo "Backup saved to $BACKUP_DIR"
