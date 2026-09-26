sld "GEN-1238 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-405", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1678", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-349", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
busB = bus [label: "BUS-476", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_dy [label: "TX-1694", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-350", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-764", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
tie = bus_tie [label: "CB-399", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-792", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1433", rating: "HOUSE PANEL / 25 kW"]
f2cb = breaker [label: "CB-389", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-717", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1446", rating: "AUXILIARY PANEL / 16 kW"]
f3cb = breaker [label: "CB-330", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-725", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1473", rating: "HOUSE PANEL / 49 kW"]

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
