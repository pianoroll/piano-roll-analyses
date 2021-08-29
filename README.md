Piano-roll analysis reports
===========================

This repository contains detailed roll image analyses that is output
from the [roll-image-parser](https://github.com/pianoroll/roll-image-parser)
software.  Analyses are found in the [analysis](https://github.com/pianoroll/piano-roll-analyses/tree/main/analysis) directory.  Filenames for each 
analysis report is based on the Stanford Libraries' DRUID (Digital Repository
Unique ID), and are sorted into subdirectories based on the first letter
of the DRUID.  Files are compressed with bzip2 and can be uncompressed
with `bunzip2 file.txt.bz2` which will uncompressed to `file.txt`.
Unix command-line viewing can be done with the command `bzcat
file.txt.bz2 | less`.  Uncompressed files are plain text in the ATON format 
and can be converted to JSON data with the [ATON javascript library](https://aton.sapp.org) (see command-line utility [aton2jon](https://github.com/craigsapp/ATON/blob/master/example/cli/aton2json).  These files are also found
in the same DRUID entry as the roll scans.

## Components of the anslyses ##

Each file contains these sections:

* `Parameters`   &mdash; Information extracted from the image (see table below).
* `HOLES`        &mdash; List of holes sort in time from beginning to end of roll.
* `BADHOLES`     &mdash; List of automatically identified bad holes that were rejected from the HOLES list.
* `BASS_TEARS`   &mdash; List of tears on the bass side of the roll, sorted by size.
* `TREBLE_TEARS` &mdash; List of tears on the treble side of the roll, sorted by size.
* `SHIFTS`       &mdash; Analysis of horizontal operator shifts along the length of the roll.
* `DRIFT`        &mdash; Horizontal drift analysis reported for every 0.1px shift in the roll image along the length of the roll (only during region where there are musical holes).
* `MIDIFILES`    &mdash;  Two MIDI files encoded as ASCII text using the [binasc](https://github.com/craigsapp/binasc) encoding of HEX bytes.  The first MIDI file removes bridging (but does not do any time corrections for the edges of holes), and the second MIDI file contains a MIDI note for each hole (not reducing bridging).
* `DEBUGGING`    &mdash; Contains an analysis of the localization of vertical tracker bar positions along the roll.

`BADHOLES`, `BASS_TEARS`, `TREBLE_TEARS`, `SHIFTS`, `DRIFT`, and
`DEBUGGING` information is given in a visual form in the image
analysis section of https://supra.stanford.edu (Click on the IA
entry for a roll to see these analyses), such as for roll
[xq762nt7491](https://supra.stanford.edu/image-analysis/?druid=xq762nt7491).


## Extracted parameters ##

| Parameter name              | Example                     | Meaning |
| --------------------------- | --------------------------- | ------- |
| `DRUID`	| xq762nt7491	| Stanford Libraries Digital Repository Unique ID	|
| `ROLL_TYPE`	| welte-red	| Brand/format of the piano roll	|
| `THRESHOLD`	| 249	| Threshold byte value for non-paper boundary	|
| `LENGTH_DPI`	| 300.25ppi	| Scan DPI resolution along the length of the roll	|
| `IMAGE_WIDTH`	| 4096px	| Width of the input image in pixels.	|
| `IMAGE_LENGTH`	| 391320px	| Length of the input image in pixels.	|
| `ROLL_WIDTH`	| 3898.31px	| Measured average width of the piano-roll in pixels.	|
| `HARD_MARGIN_BASS`	| 31px	| Pixel width of the margin on the bass side of the roll where the roll paper never enters.	|
| `HARD_MARGIN_TREBLE`	| 140px	| Pixel width of the margin on the treble side of the roll where the roll paper never enters.	|
| `MAX_BASS_DRIFT`	| 28px	| Maximum range of the "soft" margin on the bass side: the margin area where the roll edge will temporarily enter.	|
| `MAX_TREBLE_DRIFT`	| 26px	| Maximum range of the "soft" margin on the treble side: the margin area where the roll edge will temporarily enter.	|
| `AVG_SOFT_MARGIN_SUM`	| 26.69px	| Average sum of the bass and treble soft margins.	|
| `DRIFT_RANGE`	| 21.5px	| Total drift range in pixels.	|
| `DRIFT_MIN`	| 8.73px	| Leftmost drift from average position in pixels.	|
| `DRIFT_MAX`	| -12.76px	| Rightmost drift from average position in pixels.	|
| `PRELEADER_ROW`	| 2620px	| Last pixel row of the portion of the image which contains the velcro strap that initially pulls the roll.	|
| `LEADER_ROW`	| 4744px	| Last pixel row of the leader (although text on the roll may continue).	|
| `FIRST_HOLE`	| 23704px	| Pixel row of the first musical hole.	|
| `LAST_HOLE`	| 387015px	| Pixel row of the end of the last musical hole. Currently includes rewind holes and any punches after the rewind.	|
| `END_MARGIN`	| 4305px	| `IMAGE_LENGTH` - `LAST_HOLE`.	|
| `MUSICAL_LENGTH`	| 363311px	| Pixel row count from the first music hole to the end of the last music hole.	|
| `MUSICAL_HOLES`	| 20503	| Estimated number of intentional holes to be read by the tracker bar.	|
| `MUSICAL_NOTES`	| 11257	| Number of notes after grouping chained holes (expression tracks count as notes in this census).	|
| `AVG_HOLE_WIDTH`	| 19.32px	| Average width of a musical hole in pixels (based on holes' bounding boxes).	|
| `ANTIDUST_COUNT`	| 86	| Number of holes in the paper with an area less than 50 pixels (the smallest music holes typically have 300 pixels)	|
| `BAD_HOLE_COUNT`	| 4	| Number of suspcious holes pulled out for further observation.	|
| `EDGE_TEAR_COUNT`	| 3	| Number of edge tears which are deeper than 1/10 of an inch.	|
| `BASS_TEAR_COUNT`	| 3	| Number of tears on the bass register side of the roll.	|
| `TREBLE_TEAR_COUNT`	| 0	| Number of tears on the treble register side of the roll.	|
| `DUST_SCORE`	| 81ppm	| Count of dust particles in hard margin regions in units of parts per million.	|
| `DUST_SCORE_BASS`	| 89ppm	| Dust particle count in bass register margin.	|
| `DUST_SCORE_TREBLE`	| 73ppm	| Dust particle count in bass register margin.	|
| `SHIFTS`	| 2	| Number of automatically detected operator shifts greater than 1/100th of an inch over 1/3 of an inch.	|
| `HOLE_SEPARATION`	| 37.8099px	| Distance between muiscal hole centers (i.e., the tracker bar hole spacings).	|
| `HOLE_OFFSET`	| 18.8502px	| The offset of the tracker bar spacing pattern with respect to the first column of the image.	|
| `TRACKER_HOLES`	| 100	| The (esitmated) number of tracker bar holes that reads this roll.	|
| `SOFTWARE_DATE`	| Mar 26 2019 16:32:26	| The compiling date for the software that generates this file.	|
| `ANALYSIS_DATE`	| Sun Apr  7 16:04:52 2019	| The date that the analysis was done.	|
| `ANALYSIS_TIME`	| 78.15sec	| The duration of the analysis phase of the software (excluding loading of the image data or writing the analysis overlay onto the image).	|
| `COLOR_CHANNEL`	| green	| The color channel used to generate this analysis data.	|
| `CHANNEL_MD5`	| c4146a3ff5cb998aff628d4934380f97	| The MD5 checksum of the color channel pixels used in this analysis.	|
| `BRIDGE_FACTOR`	| 1.37	| Aspect ratio merging distance for adjacent holes.	|
| `MANUAL_EDITS`	| no	| Set this field to "yes" if any manual edits are made to this file.	|

