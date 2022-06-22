#!/bin/bash

FILENAME="Memory Pressure.sgrd"
echo -n "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE KSysGuardWorkSheet>
<WorkSheet interval=\"0.5\" rows=\"2\" columns=\"1\" locked=\"0\" title=\"Memory Pressure\"><host command=\"" >> "$FILENAME"
echo -n "$(pwd)" >> "$FILENAME"
echo "/pressure-sensor.pl\" port=\"-1\" name=\"Pressure\" shell=\"\"/>
 <display hScale=\"6\" stacked=\"0\" class=\"FancyPlotter\" vLines=\"0\" rowSpan=\"1\" title=\"Memory Pressure Rolling Averages\" vDistance=\"30\" version=\"1\" manualRange=\"0\" showUnit=\"0\" svgBackground=\"\" row=\"1\" column=\"0\" vScroll=\"0\" hLines=\"1\" labels=\"1\" fontSize=\"8\" autoRange=\"1\" unit=\"\" columnSpan=\"1\">
  <beam hostName=\"Pressure\" sensorType=\"float\" color=\"0xff0057ae\" sensorName=\"Memory/m_some_10sec\"/>
  <beam hostName=\"Pressure\" sensorType=\"float\" color=\"0xffe20800\" sensorName=\"Memory/m_some_60sec\"/>
  <beam hostName=\"Pressure\" sensorType=\"float\" color=\"0xfff3c300\" sensorName=\"Memory/m_some_300sec\"/>
 </display>
 <display hScale=\"6\" stacked=\"1\" class=\"FancyPlotter\" vLines=\"0\" rowSpan=\"1\" title=\"Memory Pressure Over Time (some vs full)\" vDistance=\"30\" version=\"1\" manualRange=\"0\" showUnit=\"0\" svgBackground=\"\" row=\"0\" column=\"0\" vScroll=\"0\" hLines=\"1\" labels=\"1\" fontSize=\"8\" autoRange=\"1\" unit=\"\" columnSpan=\"1\">
  <beam hostName=\"Pressure\" sensorType=\"float\" color=\"0xff0057ae\" sensorName=\"Memory/m_some_10sec\"/>
  <beam hostName=\"Pressure\" sensorType=\"float\" color=\"0xffe20800\" sensorName=\"Memory/m_full_10sec\"/>
 </display>
</WorkSheet>" >> "$FILENAME" 