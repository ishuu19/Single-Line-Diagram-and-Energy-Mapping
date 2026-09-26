sld "GEN-1072 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-419", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-377", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-708", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
busB = bus [label: "BUS-408", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_dy [label: "TX-1629", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-323", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-783", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
tie = bus_tie [label: "CB-336", rating: "800 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-320", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-745", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1406", rating: "HOUSE PANEL / 52 kW"]
f2cb = breaker [label: "CB-337", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1499", rating: "AUXILIARY PANEL / 13 kW"]
f3cb = breaker [label: "CB-389", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-706", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1443", rating: "SALES FLOOR LIGHTING / 43 kW"]

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
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
