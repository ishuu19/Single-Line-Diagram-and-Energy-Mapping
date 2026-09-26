sld "GEN-0411 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-470", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1669", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-384", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1cb = breaker [label: "CB-320", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1pnl = hub [label: "FD-981", rating: "3P+N"]
f1l1ld = load [label: "PNL-1463", rating: "SALES FLOOR LIGHTING / 54 kW"]
f1l2ld = load [label: "PNL-1491", rating: "HOUSE PANEL / 64 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-729", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f2pnl = hub [label: "FD-923", rating: "3P+N"]
f2l1ld = load [label: "PNL-1426", rating: "SALES FLOOR LIGHTING / 27 kW"]
f2l2ld = load [label: "PNL-1439", rating: "SALES FLOOR LIGHTING / 36 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
