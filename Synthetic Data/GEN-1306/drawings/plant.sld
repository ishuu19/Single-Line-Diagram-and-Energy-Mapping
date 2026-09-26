sld "GEN-1306 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-466", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1697", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
busB = bus [label: "BUS-414", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1630", rating: "1730 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-387", rating: "ACB / 2500 A / 3P"]
mctB1 = ct [label: "TA-719", rating: "3 CTs / 2500/5 A"]
mpmB1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
tie = bus_tie [label: "CB-370", rating: "800 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-312", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-704", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1481", rating: "MCC AUXILIARY BOARD / 54 kW"]
f2cb = breaker [label: "CB-303", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-753", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1439", rating: "AUXILIARY PANEL / 526 kW"]
f3cb = breaker [label: "CB-300", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-710", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1436", rating: "AUXILIARY PANEL / 139 kW"]

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
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
