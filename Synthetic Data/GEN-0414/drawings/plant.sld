sld "GEN-0414 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-449", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1672", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-387", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-788", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
busB = bus [label: "BUS-424", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "500 kW"]
mcbB1 = breaker [label: "CB-367", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-722", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
tie = ats [label: "CB-342", rating: "1000 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-354", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1454", rating: "TENANT PANEL / 90 kW"]
f2cb = breaker [label: "CB-364", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-782", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f2pnl = hub [label: "FD-999", rating: "3P+N"]
f2l1ld = load [label: "PNL-1411", rating: "TENANT PANEL / 82 kW"]
f2l2ld = load [label: "PNL-1419", rating: "FLOOR LIGHTING / 43 kW"]

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
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
