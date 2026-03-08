#!/bin/bash
set -e

# Charger le module si nécessaire
modprobe xpad 2>/dev/null || true

# Attendre que le device soit prêt
sleep 0.5

# Trouver le bon event device pour la manette Xbox
EVENT_DEV=$(grep -A 20 'Microsoft X-Box One S pad' /proc/bus/input/devices \
  | grep -oP 'event\d+' \
  | head -1)

if [[ -z "$EVENT_DEV" ]]; then
  echo "❌ Manette Xbox non trouvée dans /proc/bus/input/devices"
  exit 1
fi

DEVICE="/dev/input/$EVENT_DEV"
echo "✅ Manette trouvée : $DEVICE"

# Déclencher une vibration pour initialiser la manette
echo "🎮 Initialisation par vibration..."
echo "5" | timeout 2 fftest "$DEVICE" > /dev/null 2>&1 || true

echo "✅ Manette initialisée !"