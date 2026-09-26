sld "GEN-0458 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-471", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1686", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-703", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
busB = bus [label: "BUS-421", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_dy [label: "TX-1606", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-301", rating: "MCCB / 400 A / 3P"]
mctB1 = ct [label: "TA-774", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
tie = bus_tie [label: "CB-366", rating: "1600 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-777", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1407", rating: "AUXILIARY PANEL / 33 kW"]
f2cb = breaker [label: "CB-313", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-757", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1465", rating: "AUXILIARY PANEL / 30 kW"]
f3cb = breaker [label: "CB-324", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-743", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1442", rating: "AUXILIARY PANEL / 10 kW"]

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
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#1/0 AWG"]
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
