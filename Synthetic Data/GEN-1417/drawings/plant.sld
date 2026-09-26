sld "GEN-1417 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-468", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1619", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-375", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-702", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f1cb = breaker [label: "CB-396", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-777", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1pnl = hub [label: "FD-942", rating: "3P+N"]
f1l1cb = breaker [label: "CB-356", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-829", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1193", rating: "19 kW / CRAC"]
f1l2ld = load [label: "PNL-1435", rating: "RISER PANEL / 87 kW"]
f2cb = breaker [label: "CB-337", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-708", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-307", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1194", rating: "5 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
