sld "GEN-1524 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-454", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1657", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-377", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-779", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1409", rating: "SALES FLOOR LIGHTING / 20 kW"]
f2cb = breaker [label: "CB-366", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-704", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f2pnl = hub [label: "FD-978", rating: "3P+N"]
f2l1ld = load [label: "PNL-1489", rating: "SALES FLOOR LIGHTING / 27 kW"]
f2l2ld = load [label: "PNL-1422", rating: "SALES FLOOR LIGHTING / 39 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
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
