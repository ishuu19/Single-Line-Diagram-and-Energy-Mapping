sld "GEN-0300 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-492", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1648", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-359", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-738", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-348", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-828", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1159", rating: "15 kW / CRAC"]
f2cb = breaker [label: "CB-370", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-757", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-373", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1122", rating: "13 kW / EF"]
f3cb = breaker [label: "CB-301", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-772", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f3pnl = hub [label: "FD-955", rating: "3P+N"]
f3l1ld = load [label: "PNL-1418", rating: "TENANT PANEL / 73 kW"]
f3l2cb = breaker [label: "CB-386", rating: "MCCB / 25 A / 3P"]
f3l2m = motor [label: "MTR-1109", rating: "10 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
