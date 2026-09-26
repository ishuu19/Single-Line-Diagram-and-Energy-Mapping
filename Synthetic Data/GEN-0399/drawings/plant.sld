sld "GEN-0399 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-463", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1680", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-310", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-770", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1cb = breaker [label: "CB-348", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-333", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-825", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1177", rating: "15 kW / AHU"]
f2cb = breaker [label: "CB-355", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-798", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1426", rating: "SITE LIGHTING / 26 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
