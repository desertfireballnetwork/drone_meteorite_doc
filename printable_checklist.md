---
title: Printable checklist
---

# {{ site.title }}

## Day/Survey start
- [ ] Set up RTK basestation (needs time to get a lock).
- [ ] Reset position in the basestation RTK web interface. [Trimble_configuration](RTK_base_station.html#trimble-configuration)  (**needs to be done every time the RTK basestation moves †**)
- [ ] Deploy landing pad.
- [ ] Set up drone. All arms properly locked.
- [ ] Set up camera (M300: use 50mm lens). Lens cap off. Lens is clean?
- [ ] Controller power. Check both interal and external batteries are well charged.
- [ ] Drone power.
- [ ] Drone IMU/Compass calibration:
    *   Camera view, Flight controller settings, Sensor status - IMU/Compass - calibrate both as per instructions
    *   Camera gimball calibration - Camera, Gimball settings - calibrate
- [ ] Go through [flight parameters](main_survey_capture.html#flight-parameters) checklist.
- [ ] Configure connection to RTK base station or NTRIP.
- [ ] Select flight plan.
- [ ] Assess whether lighting conditions are okay (sun angles if sunny, enough light for good picture quality if cloudy).

_†: the Drone will complain about RTK __only__ when the RTK position changed by a lot (many kilometres). Otherwise, there will be a systematic offset error, typically worse than if RTK was not used at all_

<div style="page-break-after: always;"></div>
# {{ site.title }}

## Between flights pit stop
- [ ] Hot-swap batteries. Batteries locked?
- [ ] Swap SD card; need >20 GB free on memory card.
- [ ] Lens looks clean?


## Housekeeping (after the flight has taken off)
- [ ] Cycle batteries: drone -> cool down (shade or fridge) -> charging station.
- [ ] Download data: SD card -> computer.
- [ ] check image focus using 100% zoom level on a computer.
- [ ] make decision on whether there should be a next flight: sun angles -> too long shadows? low light -> too high-ISO?
- [ ] Check RTK station batteries.
- [ ] Check controller battery.


## End of day
- [ ] Recharge drone batteries.
- [ ] Recharge controller batteries.
- [ ] Turn off RTK station (do not move it!).
- [ ] Recharge RTK station batteries.
- [ ] Pack drone and camera.

