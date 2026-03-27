---
title: Mobile Device RTK set-up
---
# {{ page.title }}

**Note: we are no longer using RTK for stage 4 follow-up**

*   Install GNSS Master app (Android only, N/A for Apple devices)
    *   NTRIP Client V2
    *   NTRIP port 2101
    *   IP address as selected in Trimble R10 base station setup
    *   Credentials: admin/password
    *   Status -> Mock location

*   GNSS -> Bluetooth
    *   Pairing PIN: 1234
    *   Bluetooth device name: RTK\_GNSS\_long-number

_(Note: put a sticker on the GNSS receivers so the will not mix up, people easily select the one that they already had paired.)_

*   Android settings
    *   Enable developer mode (Settings -> About phone -> Software information -> tap 7x on Build number)
    *   In Developer options -> Select mock location app -> GNSS Master

_(Note: this cuts off the in-device GPS, so when GNSS RTK receiver is not blootooth tethered, there is no location update for the Andoid device, silently stuck at the last position.)_
