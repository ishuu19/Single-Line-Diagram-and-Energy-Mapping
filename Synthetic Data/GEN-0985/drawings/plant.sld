sld "GEN-0985 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-490", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1640", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-367", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-769", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1cb = breaker [label: "CB-309", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-754", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1pnl = hub [label: "FD-909", rating: "3P+N"]
f1l1ld = load [label: "PNL-1404", rating: "AUXILIARY PANEL / 43 kW"]
f1l2cb = breaker [label: "CB-302", rating: "MCCB / 80 A / 3P"]
f1l2m = motor [label: "MTR-1103", rating: "32 kW / COND"]
f2cb = breaker [label: "CB-394", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-340", rating: "MCCB / 80 A / 3P"]
f2l1m = motor [label: "MTR-1101", rating: "32 kW / COND"]
f3cb = breaker [label: "CB-393", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-701", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-325", rating: "MCCB / 100 A / 3P"]
f3l1drv = vfd [label: "DRV-896", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1138", rating: "47 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
