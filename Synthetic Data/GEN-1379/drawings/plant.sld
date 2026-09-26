sld "GEN-1379 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-437", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1629", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-317", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-792", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
busB = bus [label: "BUS-466", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_dy [label: "TX-1647", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-377", rating: "MCCB / 400 A / 3P"]
mctB1 = ct [label: "TA-750", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
tie = bus_tie [label: "CB-309", rating: "2000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-726", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1493", rating: "AUXILIARY PANEL / 40 kW"]
f2cb = breaker [label: "CB-368", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-739", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1412", rating: "AUXILIARY PANEL / 9 kW"]
f3cb = breaker [label: "CB-316", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-749", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1481", rating: "AUXILIARY PANEL / 12 kW"]

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
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
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
