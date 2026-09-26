sld "GEN-1446 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-467", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-334", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-341", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-781", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1450", rating: "RISER PANEL / 68 kW"]
f2cb = breaker [label: "CB-322", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-766", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f2pnl = hub [label: "FD-976", rating: "3P+N"]
f2l1ld = load [label: "PNL-1463", rating: "COMMON AREA LIGHTING / 34 kW"]
f2l2cb = breaker [label: "CB-343", rating: "MCCB / 20 A / 3P"]
f2l2m = motor [label: "MTR-1193", rating: "9 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
