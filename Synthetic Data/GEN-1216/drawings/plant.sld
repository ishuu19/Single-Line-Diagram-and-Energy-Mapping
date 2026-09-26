sld "GEN-1216 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-488", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1693", rating: "9560 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-307", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-722", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-340", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-727", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1492", rating: "DISTRIBUTION FEEDER / 914 kW"]
f2cb = breaker [label: "CB-391", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-797", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1418", rating: "STATION SERVICE / 80 kW"]
f3cb = breaker [label: "CB-338", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-753", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1414", rating: "DISTRIBUTION FEEDER / 1025 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
