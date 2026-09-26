sld "GEN-0419 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-407", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1632", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-389", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-752", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1cb = breaker [label: "CB-371", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1pnl = hub [label: "FD-959", rating: "3P+N"]
f1l1cb = breaker [label: "CB-372", rating: "MCCB / 80 A / 3P"]
f1l1m = motor [label: "MTR-1100", rating: "34 kW / COND"]
f1l2cb = breaker [label: "CB-338", rating: "MCCB / 80 A / 3P"]
f1l2drv = vfd [label: "DRV-818", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1162", rating: "38 kW / COMP"]
f2cb = breaker [label: "CB-308", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-732", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-368", rating: "MCCB / 200 A / 3P"]
f2l1drv = vfd [label: "DRV-890", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1155", rating: "80 kW / COMP"]
f3cb = breaker [label: "CB-337", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-786", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1447", rating: "DOCK PANEL / 17 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
