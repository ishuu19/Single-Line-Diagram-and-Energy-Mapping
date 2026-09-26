sld "GEN-1386 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-494", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1649", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-398", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-744", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f1cb = breaker [label: "CB-387", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-737", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1pnl = hub [label: "FD-907", rating: "3P+N"]
f1l1cb = breaker [label: "CB-347", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1192", rating: "6 kW / EF"]
f1l2ld = load [label: "PNL-1400", rating: "SHORE POWER PANEL / 38 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
