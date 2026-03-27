---
title: Main Survey Data Collection
---


## Main Survey requirements
_This section is in case using other drone than M300 + Zenmuse P1 & 50mm lens_

### Pictures quality

*   Final **ground resolution** should be between 1.8 mm/pix and 2.2 mm/ pix resolution, know your drone, know your resolution. This may be relaxed if looking for larger meteorites (>300g).
*   Focus: images should be in focus at all points in the image (even in corners) at the flight altitude.
*   Motion blur. Maximum flight survey speed shgould be determined so that motion blur does not exceed 1 pixel during one exposure. Note: motion blur may not be visible in the images, so this really needs to be calculated.
*   Flight speed calculation. Example: shutter speed 1/2000 s, 1 pixel max blur, 2 mm/pixel GSD -> v = 2mm / (1/2000)s = 4 m/s.
*   There technically doesn't need to be any overlap between the images. However, you need to figure out a safe overlap to make sure there are no gaps in the survey, considering no drone will fly a perfect survey.
*   If sunny: **Minimum sun elevation: TBD X degrees** (to avoid long shadows creating too many false positives.). Use [https://www.sunearthtools.com/dp/tools/pos\_sun.php](https://www.sunearthtools.com/dp/tools/pos_sun.php) to calculate survey start/end times for your location.
*   If overcast: shadows are not an issue, but picture quality may start to degrade due to not enough light (too high ISO). This is camera dependant.


### Metadata

Special attention should be given to make sure appropriate **metadata is tagged in the images**, otherwise it will be a mess and the survey may have to be redone from scratch.

*   Drone GPS coordinates, Drone speed, Drone and gimbal yaw/pitch/roll. These should all be present in the Exif of the survey images.
*   Flying the survey drone with **Real-Time Kinematics** (either using your own RTK base station, or connecting to a nearby one online) is very desirable. It will record better metadata for georeferencing (altitude notably). And, depending on the configuration of your drone, it will help it fly at a constant altitude.
*   Timezone set to UTC




## Survey Preparation Prior to Fieldtrip

When the data is processed, the oldest images are somewhat prioritised. Hence for the higher priority/probability areas to be processed and seen first, they should be surveyed first.

The simplest way to achieve this is to use Google Earth to cut the search area polygon into 5-20 smaller polygons, depending on the size of the survey:

*   Import the kmz/kml fall line bounds that are output by the darkflight calculations
*   Adjust the transparency to ~30-40 percent and change the colour (pick your favourite), this will allow you to keep the background visible so you know if you planned flights cover the entire fall zone
*   Move the cursor back and forth across the fall zone, while monitoring the ground elevation in the bottom corner of the screen, make a mental note of any major elevation shifts or gradual inclines across the fall zone
*   Using the polygon tool, draw a ~1 km x 1 km box at one end of the fall zone
*   If there is an elevation shift or difference of more than 5 m, tailor the shape such that the elevation does not change by more than 5 m within the polygon
*   Repeat drawing polygons until the entire fall zone is covered, make sure to overlap the polygons by 30 m. Try not to make the polygons too elongated (no more than a 10:1 ratio for longest:shortest axes).
*   To save each polygon to a kml, right click on its entry under ‘Places’ (a tab menu on the left side of Google Earth), and Rename it. Try to use a naming convention that makes sense, such as the name of the fall site, and general relative direction, and a sequence number that will sort them by survey priority.
    *   BoreZ\_03\_FarEast
    *   BoreZ\_01\_East
    *   BoreZ\_03\_MiddleNorth ... etc
*   Once renamed, right click again and select ‘Save Place As…’, which should show you a filesave dialog window. Make sure to save as a .kml


## Upload survey area to the drone flight controller

### M300 and Mavic 3 Pro

*   Once all are saved, copy the kmls to the micro-SD card that will slot into the M300 smart controller, make sure to save another set of copies in the trip log directory.
*   convert the .kml files into flightplans on the M300 smart controller
    *   TODO This section needs to be redone by Seamus once I have the flight controller in hand, I want to be more specific about the sub menu details and names
    *   With the .kml-loaded micro-SD card inserted into the smart controller, select 'Flight Route', 'Import Route(KMZ/KML)', and select your .kml, then select 'mapping' as the flight type, the flight mission should appear in the list of missions
    *   Select your new mission, near the top left you should see your mission name, and to the left of the name a blue circle with a white triangle, this will begin the mission when you are ready
    *   To the right of the survey name should be be a drop down arrow, select that and a menu should appear with some flight info, elect the pen and line icon to change the parameters. See parameters in the next sections.


## Flight parameters

### M300

*   First, scroll to the bottom and select 'Advanced Settings'
    - [ ] change Side and Frontal Overlap to 10% each, Margin should be 0.
    - [ ] Distance Interval Shot.
    - [ ] Shutter priority.
    - [ ] Shutter speed: 1/2000 s.
*   Go back to parent menu, and start from the top.
    - [ ] Select your camera 'Zenmuse P1' and your camera lens '50 mm'
    - [ ] Smart Oblique 'OFF'
    - [ ] GSD should be ~0.2 cm/pix when you are finished, but it should not be correct when it first appears
    - [ ] Safe takeoff altituted should be 20 m, adjust if local terrain requires
    - [ ] Terrain Follow 'OFF'
    - [ ] Altitude Mode 'Relative to Takeoff Point'
    - [ ] Flight Route Altitude should be between 25-30 m
    - [ ] Target Surface to Takeoff point should be 0 unless there are major elevation differences between your takeoff point and the survey area
    - [ ] Takeoff Speed '10 m/s'
    - [ ] Speed '4 m/s'
    - [ ] Course Angle: adjust to whatever makes sense for your polygon, typically cross the fall line.
    - [ ] Elevation optimization 'OFF'
    - [ ] Upon Completion 'Return to Home'
- [ ] Once Complete, double check that the parameters are correct, and press the back arrow at the top left of the screen, make sure to save your changes
*   Go to camera mode
    *   P1 camera settings - in camera view
        - [ ] Shutter priority, 1/2000 s
        - [ ] ISO auto
        - [ ] First waypoint AF
        - [ ] Check focus, mind trees - we need to focus on ground not top of trees!
        - [ ] The drone does focus on flight path resume (after eg swapping batts/mem card), so focus needs to be checked each time.


### Mavic 3 Pro

### Phantom 4


## Conducting the survey

### General tips
*   One person should always be monitoring the drone during flight, this is their only job, this is a critical point of failure even though it is boring. This is also the only part of the process that could be dangerous as the drone could collide with crewed aircraft, people on the ground, or power lines (fire hazard)
*   Every pass across the current flight zone you should look up to visually check the altitude and clearance above any obstacles
*   A previous error was encountered when the survey height was less than 30 m, the drone’s height would begin to drop over the course of the flight and the barometer sensor would not register the change, only the ventral ultrasonic sensors. RTK surveying helps maintain target altitude.
*   The smart controller volume should be loud enough to just make out the image capture sound effect every ~1 to 2 seconds, this will help inform you if the drone is behaving properly
*   The drone pilot should rotate out with another pilot after 2 flights to keep them alert, rotating out between each flight is acceptable
*   When the drone batteries are below 20% you should wait until it has completed a pass across the fall zone and is on the side closer to you to recall the drone
*   recall the drone by pressing and holding the ‘home’ button on the controller (the controller should start beeping)
*   monitoring its return



### Day start checklist
- [ ] Set up RTK basestation (needs time to get a lock)
- [ ] Reset position in the basestation RTK web interface (**needs to be done every time the RTK basestation moves**)
- [ ] Deploy landing pad
- [ ] Set up drone + camera (M300: use 50mm lens)
- [ ] Clean lens
- [ ] Controller power
- [ ] Drone power
- [ ] Drone IMU/Compass calibration
    *   Camera view, Flight controller settings, Sensor status - IMU/Compass - calibrate both as per instructions
    *   Camera gimball calibration - Camera, Gimball settings - calibrate
- [ ] Go through [flight parameters](#flight-parameters) checklist
- [ ] Select flight plan
- [ ] Assess whether lighting conditions are ok (sun angles if sunny, enough light for good picture quality if cloudy)


### Pre-flight checklist
- [ ] Fresh batteries
- [ ] 20 GB free on memory card
- [ ] Lens looks clean

### End-flight checklist
- [ ] Hot-swap batteries (one at the time)
- [ ] Change SD card
(after the next flight has taken off)
- [ ] Cycle batteries: drone -> fridge -> charging station
- [ ] Download data: SD card -> computer
- [ ] check image focus using 100% zoom level on a computer.
- [ ] make decision on whether there should be a next flight: sun angles -> too long shadows. low light -> too high-ISO?


_Note: the Drone will complain about RTK __only__ when the RTK position changed by a lot (many kilometres). Otherwise, there will be a systematic offset error, typically worse than if RTK was not used at all_