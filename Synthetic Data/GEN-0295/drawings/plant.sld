sld "GEN-0295 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-400", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1692", rating: "690 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-300", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-716", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
busB = bus [label: "BUS-401", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1600", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-328", rating: "MCCB / 400 A / 3P"]
mctB1 = ct [label: "TA-776", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
tie = bus_tie [label: "CB-336", rating: "630 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-351", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-724", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1494", rating: "HOUSE PANEL / 47 kW"]
f2cb = breaker [label: "CB-383", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1446", rating: "AUXILIARY PANEL / 25 kW"]
f3cb = breaker [label: "CB-333", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-786", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1423", rating: "HOUSE PANEL / 35 kW"]

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
