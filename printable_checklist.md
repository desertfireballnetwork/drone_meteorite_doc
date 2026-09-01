---
title: Printable checklist
---

# {{ site.title }}

## Day/Survey start
- [ ] <i class="fa-solid fa-satellite-dish"></i> Set up RTK basestation (needs time to get a lock).
- [ ] <i class="fa-solid fa-gears"></i> Reset position in the basestation RTK web interface. [Trimble_configuration](RTK_base_station.html#trimble-configuration)  (**needs to be done every time the RTK basestation moves †**)
- [ ] <i class="fa-solid fa-square"></i> Deploy landing pad, >5 m from any gear and obstacles.
- [ ] <i class="fa-solid fa-helicopter"></i> Set up drone. All arms properly locked?
- [ ] <i class="fa-solid fa-battery-full"></i> Install batteries.
- [ ] <i class="fa-solid fa-camera"></i> Set up camera (M300: use 50mm lens). Lens cap off. Lens is clean?
- [ ] <i class="fa-solid fa-gamepad"></i> Controller power. Check both interal and external batteries are well charged.
- [ ] <i class="fa-solid fa-wifi"></i> Configure WiFi connection to RTK base station or NTRIP. [RTK configuration](RTK_base_station.html#rtk-setup-on-drone-controller)
- [ ] <i class="fa-solid fa-power-off"></i> Drone power.
- [ ] <i class="fa-solid fa-compass"></i> Drone IMU/Compass calibration:
    *   Camera view, Flight controller settings, Sensor status - IMU/Compass - calibrate both as per instructions.
    *   Camera gimball calibration - Camera, Gimball settings - calibrate.
    *   Restart drone.
- [ ] <i class="fa-solid fa-list-check"></i> Go through [flight parameters](main_survey_capture.html#flight-parameters) checklist.
- [ ] <i class="fa-solid fa-route"></i> Select flight plan.
- [ ] <i class="fa-solid fa-cloud-sun"></i> Assess whether lighting conditions are okay (sun angles if sunny, enough light for good picture quality if cloudy).

_†: the Drone will complain about RTK __only__ when the RTK position changed by a lot (many kilometres). Otherwise, there will be a systematic offset error, typically worse than if RTK was not used at all_



<div style="page-break-after: always;"></div>
# {{ site.title }}

## Between flights pit stop
- [ ] <i class="fa-solid fa-battery-full"></i> Hot-swap batteries. Batteries locked?
- [ ] <i class="fa-solid fa-sd-card"></i> Swap SD card; need >20 GB free on memory card.
- [ ] <i class="fa-solid fa-camera"></i> Lens looks clean?


## Housekeeping (after the flight has taken off)
- [ ] <i class="fa-solid fa-up-down"></i> Check drone surveying altitude, to make sure it matches the original plan.
- [ ] <i class="fa-solid fa-arrows-rotate"></i> Cycle batteries: drone -> cool down (shade or fridge) -> charging station.
- [ ] <i class="fa-solid fa-download"></i> Download data: SD card -> computer.
- [ ] <i class="fa-solid fa-magnifying-glass-plus"></i> Check image focus using 100% zoom level on a computer.
- [ ] <i class="fa-solid fa-upload"></i> Stage images, and monitor upload progress.
- [ ] <i class="fa-solid fa-cloud-sun"></i> make decision on whether there should be a next flight: sun angles -> too long shadows? low light -> too high-ISO?
- [ ] <i class="fa-solid fa-satellite-dish"></i> Check RTK station batteries.
- [ ] <i class="fa-solid fa-gamepad"></i> Check controller battery.


## End of day
- [ ] <i class="fa-solid fa-battery-half"></i> Recharge drone batteries.
- [ ] <i class="fa-solid fa-gamepad"></i> Recharge controller batteries.
- [ ] <i class="fa-solid fa-power-off"></i> Turn off RTK station (do not move it!).
- [ ] <i class="fa-solid fa-satellite-dish"></i> Recharge RTK station batteries.
- [ ] <i class="fa-solid fa-suitcase"></i> Pack drone and camera.

