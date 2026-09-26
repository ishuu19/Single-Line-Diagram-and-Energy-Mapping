sld "GEN-1257 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-487", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1696", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-305", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
srcA2 = utility [label: "22kV STANDBY", voltage: "22kV"]
mcbA2 = breaker [label: "CB-385", rating: "ACB / 400 A / 3P"]
mctA2 = ct [label: "TA-717", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1cb = breaker [label: "CB-300", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1pnl = hub [label: "FD-958", rating: "3P+N"]
f1l1ld = load [label: "PNL-1415", rating: "FLOOR LIGHTING / 86 kW"]
f1l2ld = load [label: "PNL-1424", rating: "AUXILIARY PANEL / 15 kW"]
f2cb = breaker [label: "CB-318", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-771", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1496", rating: "AUXILIARY PANEL / 40 kW"]
f3cb = breaker [label: "CB-359", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-741", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1476", rating: "AUXILIARY PANEL / 45 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
