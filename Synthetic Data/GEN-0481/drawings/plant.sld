sld "GEN-0481 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-482", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1694", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-383", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1cb = breaker [label: "CB-342", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-718", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1415", rating: "RECTIFIER PDU / 39 kW"]
f2cb = breaker [label: "CB-359", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-793", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-376", rating: "MCCB / 32 A / 3P"]
f2l1drv = vfd [label: "DRV-882", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1102", rating: "18 kW / CRAC"]
f3cb = breaker [label: "CB-353", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-766", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f3pnl = hub [label: "FD-921", rating: "3P+N"]
f3l1ld = load [label: "PNL-1459", rating: "RECTIFIER PDU / 40 kW"]
f3l2ld = load [label: "PNL-1449", rating: "RECTIFIER PDU / 35 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
