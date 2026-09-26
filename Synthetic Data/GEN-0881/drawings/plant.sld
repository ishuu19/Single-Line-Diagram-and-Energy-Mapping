sld "GEN-0881 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-451", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1632", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1cb = breaker [label: "CB-331", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-738", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1439", rating: "TENANT PANEL / 92 kW"]
f2cb = breaker [label: "CB-374", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-769", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f2pnl = hub [label: "FD-992", rating: "3P+N"]
f2l1cb = breaker [label: "CB-314", rating: "MCCB / 25 A / 3P"]
f2l1m = motor [label: "MTR-1122", rating: "11 kW / EF"]
f2l2ld = load [label: "PNL-1453", rating: "FLOOR LIGHTING / 83 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
