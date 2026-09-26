sld "GEN-0551 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-418", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1254", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1661", rating: "23900 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-370", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-785", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-735", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1481", rating: "STATION SERVICE / 104 kW"]
f2cb = breaker [label: "CB-333", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-794", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1440", rating: "DISTRIBUTION FEEDER / 859 kW"]
f3cb = breaker [label: "CB-304", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-767", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1414", rating: "STATION SERVICE / 142 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
