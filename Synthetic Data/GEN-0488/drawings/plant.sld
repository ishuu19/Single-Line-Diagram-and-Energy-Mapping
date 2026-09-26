sld "GEN-0488 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-428", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1647", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-351", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-796", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1cb = breaker [label: "CB-306", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1pnl = hub [label: "FD-962", rating: "3P+N"]
f1l1ld = load [label: "PNL-1477", rating: "SITE LIGHTING / 21 kW"]
f1l2ld = load [label: "PNL-1491", rating: "SITE LIGHTING / 26 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
