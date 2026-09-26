sld "GEN-1396 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-479", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1293", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1631", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1cb = breaker [label: "CB-332", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-726", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1425", rating: "STATION SERVICE / 129 kW"]
f2cb = breaker [label: "CB-315", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-788", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1441", rating: "STATION SERVICE / 113 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
