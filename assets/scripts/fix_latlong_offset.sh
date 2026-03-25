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
    NEW_LAT=$(awk -v old="$OLD_LAT" -v off="$LAT_OFFSET" 'BEGIN {printf "%+.9f", old + off}')
    NEW_LON=$(awk -v old="$OLD_LON" -v off="$LON_OFFSET" 'BEGIN {printf "%+.9f", old + off}')


    # 4. Writing: Apply the changes
    if grep -q "drone-dji:GpsLatitude=\"$OLD_LAT\"" "$img"; then
        sed -i "s/drone-dji:GpsLatitude=\"$OLD_LAT\"/drone-dji:GpsLatitude=\"$NEW_LAT\"/g" "$img"
        sed -i "s/drone-dji:GpsLongitude=\"$OLD_LON\"/drone-dji:GpsLongitude=\"$NEW_LON\"/g" "$img"
        STATUS="Success (Double Quotes)"
    else
        # Fallback for single quotes
        sed -i "s/drone-dji:GpsLatitude='$OLD_LAT'/drone-dji:GpsLatitude='$NEW_LAT'/g" "$img"
        sed -i "s/drone-dji:GpsLongitude='$OLD_LON'/drone-dji:GpsLongitude='$NEW_LON'/g" "$img"
        STATUS="Success (Single Quotes)"
    fi

    # 5. Logging
    echo "FILE: $img | LAT: $OLD_LAT -> $NEW_LAT | LON: $OLD_LON -> $NEW_LON" | tee -a "$LOG_FILE"
done

echo "Done. Results saved to $LOG_FILE."



