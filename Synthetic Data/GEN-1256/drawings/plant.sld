sld "GEN-1256 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-409", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-346", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
busB = bus [label: "BUS-453", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_dy [label: "TX-1660", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-396", rating: "MCCB / 400 A / 3P"]
mctB1 = ct [label: "TA-700", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
tie = bus_tie [label: "CB-326", rating: "800 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-350", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-740", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1pnl = hub [label: "FD-956", rating: "3P+N"]
f1l1ld = load [label: "PNL-1441", rating: "SHELTER LIGHTING / 12 kW"]
f1l2ld = load [label: "PNL-1437", rating: "SHELTER LIGHTING / 6 kW"]
f2cb = breaker [label: "CB-323", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-793", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1428", rating: "RECTIFIER PDU / 53 kW"]

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
