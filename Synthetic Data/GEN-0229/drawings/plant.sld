sld "GEN-0229 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-406", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1643", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-373", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-729", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
busB = bus [label: "BUS-450", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_dy [label: "TX-1605", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-380", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-740", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
tie = bus_tie [label: "CB-367", rating: "630 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-392", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-762", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1426", rating: "AUXILIARY PANEL / 34 kW"]
f2cb = breaker [label: "CB-307", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-767", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1495", rating: "SHOP LIGHTING / 32 kW"]
f3cb = breaker [label: "CB-342", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-790", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1432", rating: "SHOP AUXILIARIES / 39 kW"]

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
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
