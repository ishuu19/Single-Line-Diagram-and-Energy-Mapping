sld "GEN-1335 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-489", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1603", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-360", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-747", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f1cb = breaker [label: "CB-349", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-766", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1465", rating: "SALES FLOOR LIGHTING / 55 kW"]
f2cb = breaker [label: "CB-324", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-736", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1466", rating: "SALES FLOOR LIGHTING / 26 kW"]
f3cb = breaker [label: "CB-356", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-771", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f3pnl = hub [label: "FD-932", rating: "3P+N"]
f3l1cb = breaker [label: "CB-389", rating: "MCCB / 125 A / 3P"]
f3l1drv = vfd [label: "DRV-808", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1199", rating: "29 kW / AHU"]
f3l2cb = breaker [label: "CB-323", rating: "MCCB / 100 A / 3P"]
f3l2drv = vfd [label: "DRV-889", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1148", rating: "21 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
f3pnl -> f3l2cb
f3l2cb -> f3l2drv
f3l2drv -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
