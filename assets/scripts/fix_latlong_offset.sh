#!/bin/bash

# --- CONFIGURATION ---
# Replace this with the FULL PATH to the folder you just created
EXIV2_BIN="$HOME/bin/exiv2"

LAT_OFFSET="0.000580"
LON_OFFSET="0.000469"
LOG_FILE="metadata_changes.log"

# --- PROCESSING ---
for img in images/*.JPG; do
    [[ -e "$img" ]] || continue

    # 1. Extraction: Get the last word (the value) from the specific Xmp line
    OLD_LAT=$($EXIV2_BIN -pa "$img" | grep "Xmp.drone-dji.GpsLatitude" | awk '{print $NF}')
    OLD_LON=$($EXIV2_BIN -pa "$img" | grep "Xmp.drone-dji.GpsLongitude" | awk '{print $NF}')

    # Skip if tags are missing
    if [[ -z "$OLD_LAT" || -z "$OLD_LON" ]]; then
        echo "Skipping $img: DJI XMP tags not found."
        continue
    fi

    # 2. Math: Using awk for high-precision floating point math
    NEW_LAT_NUM=$(awk "BEGIN {print $OLD_LAT + $LAT_OFFSET}")
    NEW_LON_NUM=$(awk "BEGIN {print $OLD_LON + $LON_OFFSET}")

    # 3. Formatting: DJI requires exactly 13 and 14 characters
    # %+.9f ensures the '+' or '-' sign is always present
    NEW_LAT=$(printf "%+.9f" "$NEW_LAT_NUM" | cut -c1-13)
    NEW_LON=$(printf "%+.9f" "$NEW_LON_NUM" | cut -c1-14)

    # 4. Writing: Apply the changes
    $EXIV2_BIN -M"reg drone-dji http://www.dji.com/drone-dji/" \
      -M"set Xmp.drone-dji.GpsLatitude $NEW_LAT" \
      -M"set Xmp.drone-dji.GpsLongitude $NEW_LON" \
      "$img"

    # 5. Logging
    echo "FILE: $img | LAT: $OLD_LAT -> $NEW_LAT | LON: $OLD_LON -> $NEW_LON" | tee -a "$LOG_FILE"
done

echo "Done. Results saved to $LOG_FILE."


