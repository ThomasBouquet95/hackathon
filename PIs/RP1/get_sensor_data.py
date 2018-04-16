#!/usr/bin/python

import sys

from sense_hat import SenseHat
from time import sleep

sense = SenseHat()

temp = round(sense.get_temperature(), 2)
hum = round(sense.get_humidity(), 2)
pres = round(sense.get_pressure(), 2)

print("[" + str(temp) + ", " + str(hum) + ", " +  str(pres) + "]")
