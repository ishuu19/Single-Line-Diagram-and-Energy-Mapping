sld "GEN-1179 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-460", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-717", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
busB = bus [label: "BUS-467", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_yd [label: "TX-1671", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-373", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-740", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
tie = bus_tie [label: "CB-338", rating: "630 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-345", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-747", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1498", rating: "AUXILIARY PANEL / 15 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-756", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1461", rating: "REEFER RACK PANEL / 101 kW"]
f3cb = breaker [label: "CB-306", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-768", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1449", rating: "AUXILIARY PANEL / 12 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
