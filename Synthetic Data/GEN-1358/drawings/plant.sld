sld "GEN-1358 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-472", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1682", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-308", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-756", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1cb = breaker [label: "CB-321", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-747", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1pnl = hub [label: "FD-902", rating: "3P+N"]
f1l1cb = breaker [label: "CB-342", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1143", rating: "9 kW / EF"]
f1l2ld = load [label: "PNL-1410", rating: "DOCK PANEL / 16 kW"]
f2cb = breaker [label: "CB-328", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-730", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-340", rating: "MCCB / 200 A / 3P"]
f2l1drv = vfd [label: "DRV-838", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1118", rating: "45 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
