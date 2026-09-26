sld "GEN-0828 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-436", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1658", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-399", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-727", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1cb = breaker [label: "CB-304", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1415", rating: "TENANT PANEL / 55 kW"]
f2cb = breaker [label: "CB-386", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-722", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f2pnl = hub [label: "FD-966", rating: "3P+N"]
f2l1ld = load [label: "PNL-1478", rating: "TENANT PANEL / 85 kW"]
f2l2ld = load [label: "PNL-1495", rating: "TENANT PANEL / 85 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
