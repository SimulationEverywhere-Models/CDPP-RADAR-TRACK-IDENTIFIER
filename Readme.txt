The model is run using Radar.bat.

To run RadarUnit, use Radar.bat.
View the resulting log file using the Cell-DEVS animation tool.  The RSimple.pal has definitions that will 
show the targets, with different colours depending on the direction of travel.
The color palette does not yet show colors for the distinct tracks, since the track numbers are not yet unique.

The animation must be run with values showing to see the tracks.  Tracks are represented by a number:
* The integer is the track identifier.
* The decimal is the last direction in which the target was moving.  It is derived based on the last
  position of the target.  The track's view of the target (macro hasAnt) is based on the presence of the target, and
  not the target's direction of travel.  The radar layer is unaware of the target's direction of travel.
  


