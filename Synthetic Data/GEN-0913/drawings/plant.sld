sld "GEN-0913 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-431", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1683", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-369", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-740", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1pnl = hub [label: "FD-973", rating: "3P+N"]
f1l1ld = load [label: "PNL-1427", rating: "DOCK PANEL / 15 kW"]
f1l2ld = load [label: "PNL-1491", rating: "DOCK PANEL / 29 kW"]
f2cb = breaker [label: "CB-370", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-722", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-374", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1127", rating: "26 kW / COND"]
f3cb = breaker [label: "CB-384", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-790", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-301", rating: "MCCB / 200 A / 3P"]
f3l1drv = vfd [label: "DRV-877", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1112", rating: "85 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
