from sense_hat import SenseHat
from time import sleep

sense = SenseHat()

INTERVAL = 3

while True:
    temp = round(sense.get_temperature(),2)
    hum  = round(sense.get_humidity(), 2)
    pres = round(sense.get_pressure(), 2)
    print(temp)
    sleep(INTERVAL)
    