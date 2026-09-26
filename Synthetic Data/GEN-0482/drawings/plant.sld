sld "GEN-0482 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-448", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1632", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-362", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-791", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-792", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1481", rating: "AUXILIARY PANEL / 38 kW"]
f2cb = breaker [label: "CB-395", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-756", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f2pnl = hub [label: "FD-998", rating: "3P+N"]
f2l1ld = load [label: "PNL-1474", rating: "DOSING PANEL / 16 kW"]
f2l2cb = breaker [label: "CB-396", rating: "MCCB / 100 A / 3P"]
f2l2drv = vfd [label: "DRV-862", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1132", rating: "46 kW / RWP"]
f3cb = breaker [label: "CB-361", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-705", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-384", rating: "MCCB / 100 A / 3P"]
f3l1drv = vfd [label: "DRV-880", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1152", rating: "42 kW / RWP"]

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
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
