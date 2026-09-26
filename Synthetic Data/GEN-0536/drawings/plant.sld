sld "GEN-0536 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-472", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1682", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-323", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-743", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
busB = bus [label: "BUS-492", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1647", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-306", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-733", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
tie = bus_tie [label: "CB-300", rating: "800 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-350", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-745", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1406", rating: "SHORE POWER PANEL / 32 kW"]
f2cb = breaker [label: "CB-341", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-775", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1410", rating: "DOCK LIGHTING / 12 kW"]
f3cb = breaker [label: "CB-364", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-712", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1466", rating: "AUXILIARY PANEL / 8 kW"]

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
busB -> f2cb [cable: "3#1/0 AWG"]
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
