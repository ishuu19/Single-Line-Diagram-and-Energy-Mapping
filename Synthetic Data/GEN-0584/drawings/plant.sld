sld "GEN-0584 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-423", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1630", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-377", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-735", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1cb = breaker [label: "CB-337", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-739", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1pnl = hub [label: "FD-959", rating: "3P+N"]
f1l1ld = load [label: "PNL-1477", rating: "CELLAR PANEL / 17 kW"]
f1l2cb = breaker [label: "CB-378", rating: "MCCB / 50 A / 3P"]
f1l2m = motor [label: "MTR-1135", rating: "24 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
