sld "GEN-0821 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-447", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1656", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-344", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-767", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
busB = bus [label: "BUS-421", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_yd [label: "TX-1617", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-390", rating: "MCCB / 250 A / 3P"]
mctB1 = ct [label: "TA-773", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
tie = bus_tie [label: "CB-310", rating: "630 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-326", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-764", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1pnl = hub [label: "FD-936", rating: "3P+N"]
f1l1ld = load [label: "PNL-1472", rating: "SALES FLOOR LIGHTING / 40 kW"]
f1l2ld = load [label: "PNL-1440", rating: "HOUSE PANEL / 46 kW"]
f2cb = breaker [label: "CB-323", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-749", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1413", rating: "HOUSE PANEL / 44 kW"]

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
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
