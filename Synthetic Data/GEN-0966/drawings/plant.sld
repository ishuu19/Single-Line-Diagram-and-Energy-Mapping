sld "GEN-0966 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-466", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1609", rating: "1730 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-388", rating: "ACB / 2500 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 2500/5 A"]
mpmA1 = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1cb = breaker [label: "CB-382", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-722", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1pnl = hub [label: "FD-955", rating: "3P+N"]
f1l1ld = load [label: "PNL-1489", rating: "MCC AUXILIARY BOARD / 60 kW"]
f1l2ld = load [label: "PNL-1435", rating: "AUXILIARY PANEL / 217 kW"]
f2cb = breaker [label: "CB-303", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-769", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1405", rating: "MCC AUXILIARY BOARD / 67 kW"]
f3cb = breaker [label: "CB-318", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-733", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f3pnl = hub [label: "FD-992", rating: "3P+N"]
f3l1ld = load [label: "PNL-1495", rating: "AUXILIARY PANEL / 483 kW"]
f3l2cb = breaker [label: "CB-355", rating: "MCCB / 800 A / 3P"]
f3l2drv = vfd [label: "DRV-885", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1147", rating: "377 kW / MILL"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2drv
f3l2drv -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
