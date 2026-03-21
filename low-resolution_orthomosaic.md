---
title: Low-resolution orthomosaic
---

## Introduction


(optional, but this is a relatively cheap thing to do)

Satellite imagery available online is usually not high-enough resolution or up-to-date to be an effective background map.

One solution is to create a low-resolution orthomosaic using a low-resolution high-overlap drone flight. 10cm/pixel is a good target ground sampling distance. The issue is that most drones actually give a too-high ground sampling resolution, even when flying at maximum height (120 m in Australia).

Why not just use the main (high-res) survey image to do this, instead of having to capture a dedicated flight? Because stitching lots of images is very computationally costly, and the overlap in the main survey is not large enough. This mini survey will be a tiny fraction of time and bandwidth compared to the main survey, it is worth it!

## Data Collection

*   survey area: define a polygon that extends the main survey polygon by at least 100m in all directions.
*   Ground resolution: 5 cm /pixel
*   Overlap: 70%
*   If available, definitely do RTK surveying. RTK + stitching adjustments will make this background map very accurate.
*   (optional), it is possible to use Ground Control Points ([https://docs.webodm.net/how-to/ground-control-points](https://docs.webodm.net/how-to/ground-control-points)), to get even more accuracy (or if RTK is not possible with your setup).

## Data Processing

*   Upload and process the data on [WebODM Lighning (cloud version)](https://webodm.net/dashboard).
*   Download the Orthophoto data product (large GeoTiff file).
*   Degrade the GeoTiff resolution to 0.1 m/pixel using gdal: gdalwarp -tr 0.1 -0.1 source.tiff destination.tiff
*   Upload and process the tileset on Mapbox: follow instructions in section *Mapbox tileset Command Line Interface*
*   set the background tileset ID for the survey in the Webapp admin console.

## WebODM setup

*   feature-type: orb
*   use-fixed-camera-params: enable
*   sfm-no-partial: disable
*   skip-3dmodel: enable
*   skip-report: enable
*   fast-orthophoto: enable
*   dsm: disable

## Mapbox tileset Command Line Interface

*   install the [Mapbox Tilesets CLI](https://github.com/mapbox/tilesets-cli)
*   create a [Mapbox token](https://console.mapbox.com/account/access-tokens), that has all the "Upload" and "Tilesets" scopes checked.
*   set the token as environment variables: export MAPBOX\_ACCESS\_TOKEN=
*   upload the GeoTiff as data source: `tilesets upload-raster-source <username> <source\_id> ./file.tif`
*   create a recipe json file for Mapbox Tiling Service raster processing: use [this as template](https://gist.github.com/hdevillepoix/dec56b89989dcd4cede9fb12b79197e1)
*   create the tileset: `tilesets create hadry.dn230523 -r recipe.json -n dn230523-05-low`
*   publish the tileset (this triggers the processing job): tilesets publish hadry.dn230523
*   if all went well there should be a mapbox tileset available with ID "hadry.dn230523"
