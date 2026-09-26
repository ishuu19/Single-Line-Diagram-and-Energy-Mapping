sld "GEN-0281 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-408", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1629", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-326", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-765", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
busB = bus [label: "BUS-481", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_dy [label: "TX-1668", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-378", rating: "MCCB / 630 A / 3P"]
mctB1 = ct [label: "TA-746", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
tie = bus_tie [label: "CB-395", rating: "1000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-779", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1443", rating: "AUXILIARY PANEL / 40 kW"]
f2cb = breaker [label: "CB-382", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-734", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1478", rating: "SHOP AUXILIARIES / 35 kW"]
f3cb = breaker [label: "CB-340", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-777", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1488", rating: "AUXILIARY PANEL / 30 kW"]

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
