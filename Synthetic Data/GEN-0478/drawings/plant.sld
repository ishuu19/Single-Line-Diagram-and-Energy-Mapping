sld "GEN-0478 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-450", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1269", voltage: "138kV"]
mcbA1 = breaker [label: "CB-393", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-794", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1cb = breaker [label: "CB-365", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-799", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1425", rating: "DISTRIBUTION FEEDER / 698 kW"]
f2cb = breaker [label: "CB-304", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-719", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1470", rating: "DISTRIBUTION FEEDER / 735 kW"]
f3cb = breaker [label: "CB-397", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-745", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1472", rating: "DISTRIBUTION FEEDER / 556 kW"]

srcA1 -> laA1
srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
