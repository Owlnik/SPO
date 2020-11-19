#! /bin/bash

#rosservice call /spawn 1 1 1 "turtle1";
rosservice call /turtle1/set_pen 0 0 0 2 "off";
rosservice call /turtle1/teleport_absolute 1 3 0;
rosservice call /turtle1/set_pen 0 0 0 2 "on";
rosservice call /turtle1/teleport_absolute 3 1 0;
rosservice call /turtle1/set_pen 0 0 0 2 "off";
rosservice call /turtle1/teleport_absolute 3 3 0;
rosservice call /turtle1/teleport_absolute 2 3 0;
rosservice call /turtle1/teleport_absolute 2 2 0;
rosservice call /turtle1/teleport_absolute 3 2 0;
rosservice call /turtle1/set_pen 0 0 0 2 "on";
rosservice call /turtle1/teleport_absolute 4 3 0;
rosservice call /turtle1/set_pen 0 0 0 2 "off";
rosservice call /turtle1/teleport_absolute 5 3 0;
rosservice call /turtle1/teleport_absolute 5 2 0;
rosservice call /turtle1/teleport_absolute 4 2 0;
rosservice call /turtle1/teleport_absolute 4 1 0;
rosservice call /turtle1/teleport_absolute 5 1 0;
rosservice call /turtle1/set_pen 0 0 0 2 "on";
rosservice call /turtle1/teleport_absolute 6 3 0;
rosservice call /turtle1/set_pen 0 0 0 2 "off";
rosservice call /turtle1/teleport_absolute 6 2 0;
rosservice call /turtle1/teleport_absolute 7 2 0;
rosservice call /turtle1/teleport_absolute 7 3 0;
rosservice call /turtle1/teleport_absolute 7 1 0;
rosservice call /turtle1/set_pen 0 0 0 2 "on";
rosservice call /turtle1/teleport_absolute 9 1 0;
rosservice call /turtle1/set_pen 0 0 0 2 "off";
rosservice call /turtle1/teleport_absolute 9 3 0;
rosservice call /turtle1/set_pen 0 0 0 2 "on";
rosservice call /turtle1/teleport_absolute 10 3 0;
rosservice call /turtle1/set_pen 0 0 0 2 "off";
rosservice call /turtle1/teleport_absolute 11 3 0;
rosservice call /turtle1/teleport_absolute 11 2 0;
rosservice call /turtle1/teleport_absolute 10 2 0;
rosservice call /turtle1/teleport_absolute 10 1 0;
rosservice call /turtle1/teleport_absolute 11 1 0;






