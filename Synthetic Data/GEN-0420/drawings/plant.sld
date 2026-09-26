sld "GEN-0420 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-458", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1617", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-326", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-781", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1cb = breaker [label: "CB-331", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-728", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1pnl = hub [label: "FD-961", rating: "3P+N"]
f1l1cb = breaker [label: "CB-353", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1153", rating: "7 kW / EF"]
f1l2ld = load [label: "PNL-1421", rating: "FLOOR LIGHTING / 54 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
