---
title: Training Data Collection
---


Capturing quality training data is key to the whole process. Remember: Garbage in, garbage out. Hence take extra care in doing this step well.

## True images (meteorites)

### Pack list

*   Meteorites OR meteoritic shaped rocks (meaning a rock between 2 and 10 cm diameter, with no elongated axis, or sharp edges)
*   2 people: one drone pilot, one pointer.
*   black spray paint (matte or shiny).
*   a drone
*   a cardboard box and some gloves can be useful to avoid making a mess with the painted rocks

### Capturing true training data

*   Final resolution should be between 1.8 mm/pix and 2.2 mm/ pix resolution, know your drone, know your resolution. If using the M300 with the Zenmuse P1 (48 MP) camera and 50 mm lens, your altitude should be between 18 and 30 m.

If you have real meteorites with fresh fusion crusts,

*   place a meteorite and point to it at least 3 m away, then pick up the meteorite to re-place it, to then take the next picture (only repeat up to 5 times, rotating and changing orientation each time).
*   If possible place a small piece of Aluminum Foil that is smaller than the meteorite between the rock and the ground, your curator will thank you
*   DO NOT LEAVE REAL METEORITES IN A LINE LIKE FAKE ONES. WE ARE HERE TO ADD TO THE METEORITE COLLECTION NOT SUBTRACT FROM IT

If you have fake meteorites (i.e. spray-painted rocks)

*   place them in a line near different background objects (limestone rocks, saltbush, grass tuft, hole, lichen colony, etc) at least 8 m apart from the others, then walk next to the line and point to each rock
*   The pointer should walk slowly, pointing to the rock nearest to them (standing at least 3m from the rock), the drone flyer should take only one image per rock, and should call out to the pointer if the pointer moved too quickly and the flyer was unable to take an image, otherwise the flyer should confirm ‘good’ once they have taken an image of the current rock in question

For Both Real and Fake Meteorites

*   Between images, rotate the drone by up to 90 degrees to change the angle of shadows in the image.
*   Before uploading the data, remove non-useful images (duplicates of the same pointed-at rock, unrelated random pictures). This clean up step will help limiting the amount of work downstream to label the data, and ultimately keep the training dataset clean.
*   When labelling (drawing a box around the rocks) make sure to include the shadow the rock makes, that will help distinguish the rock from holes in the ground or other features that have no shadow. -> TODO copy that bit to the webapp documentation.

  
_Do we need to capture true training data at every site?_ We have built up a large dataset of meteorite and meteorite-looking rocks for training, hence the return on adding more training data tends to diminish. However, this step is a relatively low effort thing to do at each new site visited (assuming you are just doing 10-20 meteorites). Over time it does truly really help increase the variance in the training set, ultimately making model predictions more accurate. So avoid skipping it.

## False Images (background)

*   Fly in a perimeter around the fall zone and take images every 10-30 seconds.
*   During the perimeter flight, slowly adjust the height +- 5 m around the height you intend to survey at
*   If the search area displays significant variations in ground features (rock type, vegetation), try to capture as much of these different backgrounds as possible.

_Can I skip false training data collection at one site?_ No, the prediction model will perform better if trained on the local background (vegetation, rock types, animals...). So far we have not seen two fall sites that are similar enough to a point where that step could be skipped.

