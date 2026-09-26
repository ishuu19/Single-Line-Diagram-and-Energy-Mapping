sld "GEN-0448 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-403", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1211", voltage: "138kV"]
mcbA1 = breaker [label: "CB-332", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1cb = breaker [label: "CB-371", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-707", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1432", rating: "DISTRIBUTION FEEDER / 1054 kW"]

srcA1 -> laA1
srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
