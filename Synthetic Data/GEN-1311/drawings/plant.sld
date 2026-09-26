sld "GEN-1311 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-483", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1658", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-394", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-794", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
busB = bus [label: "BUS-443", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_yd [label: "TX-1684", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-398", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-772", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
tie = bus_tie [label: "CB-353", rating: "1600 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-308", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-714", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1444", rating: "SHOP AUXILIARIES / 33 kW"]
f2cb = breaker [label: "CB-376", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-766", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1455", rating: "AUXILIARY PANEL / 79 kW"]
f3cb = breaker [label: "CB-303", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-786", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1414", rating: "SHOP AUXILIARIES / 22 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
