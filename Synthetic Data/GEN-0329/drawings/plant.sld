sld "GEN-0329 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-493", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1635", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-340", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-795", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1cb = breaker [label: "CB-308", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1489", rating: "STATION SERVICE / 73 kW"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-740", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1475", rating: "DISTRIBUTION FEEDER / 746 kW"]
f3cb = breaker [label: "CB-371", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-796", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1413", rating: "STATION SERVICE / 118 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
