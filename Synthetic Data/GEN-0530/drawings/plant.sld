sld "GEN-0530 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-495", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1660", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-398", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1cb = breaker [label: "CB-327", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-717", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-373", rating: "MCCB / 80 A / 3P"]
f1l1m = motor [label: "MTR-1144", rating: "32 kW / COND"]
f2cb = breaker [label: "CB-336", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-787", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f2pnl = hub [label: "FD-979", rating: "3P+N"]
f2l1cb = breaker [label: "CB-359", rating: "MCCB / 100 A / 3P"]
f2l1drv = vfd [label: "DRV-850", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1138", rating: "49 kW / COMP"]
f2l2cb = breaker [label: "CB-352", rating: "MCCB / 50 A / 3P"]
f2l2m = motor [label: "MTR-1122", rating: "22 kW / COND"]
f3cb = breaker [label: "CB-348", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-726", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1445", rating: "DOCK PANEL / 19 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
