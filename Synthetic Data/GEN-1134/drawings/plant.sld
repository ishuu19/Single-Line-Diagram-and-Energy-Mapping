sld "GEN-1134 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-444", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1613", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-320", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
busB = bus [label: "BUS-499", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
mcbB1 = breaker [label: "CB-378", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-701", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
tie = bus_tie [label: "CB-303", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1493", rating: "AUXILIARY PANEL / 23 kW"]
f2cb = breaker [label: "CB-350", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-720", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1429", rating: "HOUSE PANEL / 51 kW"]
f3cb = breaker [label: "CB-321", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-745", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1479", rating: "HOUSE PANEL / 41 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4/0 AWG"]
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
