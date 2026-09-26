sld "GEN-0600 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-404", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1613", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-325", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-703", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1cb = breaker [label: "CB-388", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-723", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1450", rating: "AUXILIARY PANEL / 25 kW"]
f2cb = breaker [label: "CB-330", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-737", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f2pnl = hub [label: "FD-927", rating: "3P+N"]
f2l1ld = load [label: "PNL-1494", rating: "AUXILIARY PANEL / 29 kW"]
f2l2ld = load [label: "PNL-1480", rating: "WARD LIGHTING / 22 kW"]
f3cb = breaker [label: "CB-327", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-712", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f3pnl = hub [label: "FD-908", rating: "3P+N"]
f3l1cb = breaker [label: "CB-387", rating: "MCCB / 40 A / 3P"]
f3l1drv = vfd [label: "DRV-899", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1143", rating: "17 kW / AHU"]
f3l2ld = load [label: "PNL-1433", rating: "LIFE SAFETY BRANCH / 46 kW"]

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
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
