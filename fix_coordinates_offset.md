---
title: Fix coordinates offset
---

If the RTK station has been moved and not been reset in the interface,
the RTK-enabled drone's position will be offset by the same amount.


## step 1: figure out what the latitude and longitude offset is.
- Either by surveying in the field where the station was vs where it was supposed to be.
- Or by working it out based on how much the meteorite candidates are getting offset by.

## step 2: fix the exif in the survey images

### download the survey images (much faster on HPC)
```
cd /scratch/...
mkdir images
rclone copy -P --transfers 50  pawsey0639:dfn-drone-webapp-dn150413-01-east-end/raw/ images/
```

Note: good idea to make a backup of the original files at this point.

### apply the fix
See [script](assets/scripts/fix_latlong_offset.sh).

This script will:
- read in the DJI lat/long using exiv2
- apply the differential (hardcoded in the script)
- push changes using a dumb `sed` replacement (using exiv2 or exiftool messes up the XMP metadata)


### download the survey images
After you have checked that everything looks okay, replace the images on s3 with the modified ones
```
rclone copy -P --transfers 50 images/ pawsey0639:dfn-drone-webapp-dn150413-01-east-end/raw/ 
```


## step 2: fix the exif in the survey images
On the VM: `docker exec -it dfn-django /bin/bash`

```
poetry run  python manage.py reprocess_image_metadata  114
poetry run  python manage.py reset_geo_fields
nohup poetry run  python manage.py stage4_geo  114 &
```
