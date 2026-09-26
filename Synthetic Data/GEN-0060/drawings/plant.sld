sld "GEN-0060 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-436", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1655", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-347", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "208Y/120V", rating: "80 kW"]
mcbA2 = breaker [label: "CB-367", rating: "ACB / 250 A / 3P"]
mctA2 = ct [label: "TA-788", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1cb = breaker [label: "CB-381", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-755", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1pnl = hub [label: "FD-967", rating: "3P+N"]
f1l1ld = load [label: "PNL-1467", rating: "FLOOR LIGHTING / 53 kW"]
f1l2ld = load [label: "PNL-1471", rating: "FLOOR LIGHTING / 30 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
