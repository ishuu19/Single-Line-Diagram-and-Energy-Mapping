sld "GEN-1375 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-481", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
mcbA1 = breaker [label: "CB-337", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-753", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-366", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-704", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1448", rating: "DISTRIBUTION FEEDER / 570 kW"]
f2cb = breaker [label: "CB-338", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-784", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1466", rating: "STATION SERVICE / 78 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
