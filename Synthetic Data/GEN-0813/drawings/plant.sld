sld "GEN-0813 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-431", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1687", rating: "2080 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-316", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-300", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1pnl = hub [label: "FD-940", rating: "3P+N"]
f1l1ld = load [label: "PNL-1483", rating: "AUXILIARY PANEL / 229 kW"]
f1l2ld = load [label: "PNL-1441", rating: "AUXILIARY PANEL / 108 kW"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-765", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2pnl = hub [label: "FD-987", rating: "3P+N"]
f2l1ld = load [label: "PNL-1456", rating: "AUXILIARY PANEL / 185 kW"]
f2l2cb = breaker [label: "CB-307", rating: "MCCB / 320 A / 3P"]
f2l2m = motor [label: "MTR-1155", rating: "130 kW / BLOW"]
f2x = capacitor_bank [label: "CAP-696", rating: "99 kVAR"]
f3cb = breaker [label: "CB-331", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-785", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1487", rating: "AUXILIARY PANEL / 300 kW"]
f3x = capacitor_bank [label: "CAP-667", rating: "59 kVAR"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
f2pnl -> f2x
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
f3ct -> f3x
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
