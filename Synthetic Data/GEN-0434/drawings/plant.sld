sld "GEN-0434 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-457", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1272", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1660", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-307", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
srcA2 = utility [label: "138kV STANDBY", voltage: "138kV"]
laA2 = surge_arrester [label: "LA-1289", voltage: "138kV"]
txA2 = transformer_dy [label: "TX-1638", rating: "9560 kVA", voltage: "138kV / 13.8kV"]
mcbA2 = breaker [label: "CB-357", rating: "ACB / 400 A / 3P"]
mctA2 = ct [label: "TA-768", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1cb = breaker [label: "CB-338", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1497", rating: "STATION SERVICE / 65 kW"]
f2cb = breaker [label: "CB-303", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-764", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1485", rating: "STATION SERVICE / 85 kW"]
f3cb = breaker [label: "CB-389", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-747", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1419", rating: "DISTRIBUTION FEEDER / 1057 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> laA2
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
