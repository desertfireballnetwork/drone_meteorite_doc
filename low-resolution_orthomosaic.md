---
title: Low-resolution orthomosaic
---
# {{ page.title }}

## Introduction

TL;DR: this is optional, but this is a relatively cheap and useful thing to do.


**Satellite imagery available online is not always high-enough resolution or up-to-date to be an effective background map.
For terrains in which the survey images have enough distinguishable features, it is generally not an issue. If the [stage 4 interface](stage4_help.html) is a couple of meters off the target, we can relocate easily, based on a particular bush, tree, rock etc. But in other terrains, in which background features tend to all look similar enough to be confusing, being able to match the survey image to a well georeferenced wider aerial image is really helpful.**

One solution is to create a low-resolution orthomosaic using a low-resolution high-overlap drone flight. 10cm/pixel is a good target ground sampling distance. The issue is that most drones actually give a too-high ground sampling resolution, even when flying at maximum height (120 m in Australia).

Why not just use the main (high-res) survey image to do this, instead of having to capture a dedicated flight? Because stitching lots of images is very computationally costly ([RAM requirements grow linearly with the number of images](https://docs.webodm.org/hardware-requirements/)), and the overlap in the main survey is not large enough. This mini survey will be a tiny fraction of time and bandwidth compared to the main survey, it is worth it!

_not sure if satellite imagery is going to be good enough in your area?_ The webapp uses Mapbox as mapping interface -> [preview Mapbox satellite imagery](https://www.mapbox.com/maps/satellite).


## Data Collection

*   survey area: define a polygon that extends the main survey polygon by at least 100m in all directions.
*   Ground resolution: 5 cm /pixel.
*   Overlap: 70%
*   If available, definitely do RTK surveying. RTK + stitching adjustments will make this background map very accurate.
*   (optional), it is possible to use Ground Control Points ([https://docs.webodm.net/how-to/ground-control-points](https://docs.webodm.net/how-to/ground-control-points)), to get even more accuracy (or if RTK is not possible with your setup).

## Data Processing

*   Upload and process the data on [WebODM](#webodm-clouds-options).
*   Download the Orthophoto data product (large GeoTiff file).
*   Degrade the GeoTiff resolution to 0.1 m/pixel using gdal: `gdalwarp -tr 0.1 -0.1 source.tiff destination.tiff`
*   Upload and process the tileset on Mapbox: follow instructions in section [Mapbox tileset Command Line Interface](#mapbox-tileset-command-line-interface)
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


## WebODM clouds options

### Use [WebODM Lighning (cloud version)](https://webodm.net/dashboard)
This is by far the easiest option, it costs money though.

### Run your own instances of WebODM/NodeODM
[RAM requirements grow linearly with the number of images](https://docs.webodm.org/hardware-requirements/)), so even on a small search area you can end up needing a fairly high-RAM machine to process your data.

Luckily, the [Nectar GPU VM](computing_ressources.html) `g2.xlarge` used for the machine learning part comes with 128GB of RAM, good enough for stitching ~2,500 low-res images.
Easiest option is to keep a very low-spec VM running continuously with the WebODM frontend installed,
and connect the GPU VM as worker when needed. Instructions to follow **TODO**.

### Run ODM direct from command line
Follow these [instructions](odm_orthophoto_howto.html).
