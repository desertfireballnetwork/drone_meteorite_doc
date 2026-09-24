---
title: Webapp user roles
---
# {{ page.title }}


## Public
**Can see:**
 - Nothing

**Can do:**
 - Stage 1 by link only.


## Collaborator
**Can see:**
 - Requires explicit permissions to access a survey (from the core member in charge of the survey)

**Can do:**
 - Stages 1, (1.5), 2, 4 candidate review.


## Core Member
**Can see:**
 - Requires explicit permission to access particular surveys (from a super admin).
 - The list of people who have access to the survey, and their contact details (email).
 - Survey statistics: stats on user actions, candidates map, survey timeline map.
 - The data upload key.

**Can do:**
 - Everything a collaborator can do.
 - Community manage a survey: allow collaborators to access the survey.
 - See and share the link for public members to do stage 1.
 - Get/Set survey parameters: set lat/long for home point location, change the survey description, enable/disable Stage 1.5, set the orthomosaic Mapbox tileset ID.
 - Download survey metadata tables (images, inference, elimination).


## Super admin
**Can see:**
 - Everything.

**Can do:**
 - Everything a core member can do.
 - Create a new survey.
 - Delegate the management of a survey to one or several core members (except GPU jobs)
 - Trigger GPU jobs: machine learning training & inference.
 
 
