sld "GEN-0898 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-476", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1602", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-382", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1250 kW"]
mcbA2 = breaker [label: "CB-399", rating: "MCCB / 2000 A / 3P"]
mctA2 = ct [label: "TA-706", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-735", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1pnl = hub [label: "FD-941", rating: "3P+N"]
f1l1cb = breaker [label: "CB-385", rating: "MCCB / 200 A / 3P"]
f1l1drv = vfd [label: "DRV-869", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1149", rating: "83 kW / COMP"]
f1l2ld = load [label: "PNL-1497", rating: "DOCK PANEL / 22 kW"]
f2cb = breaker [label: "CB-352", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-716", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1423", rating: "DOCK PANEL / 19 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
