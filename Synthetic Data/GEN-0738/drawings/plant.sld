sld "GEN-0738 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-435", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1609", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-336", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-789", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1cb = breaker [label: "CB-388", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1pnl = hub [label: "FD-996", rating: "3P+N"]
f1l1ld = load [label: "PNL-1498", rating: "GROW LIGHTING / 54 kW"]
f1l2cb = breaker [label: "CB-315", rating: "MCCB / 32 A / 3P"]
f1l2drv = vfd [label: "DRV-871", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1108", rating: "19 kW / EF"]
f2cb = breaker [label: "CB-350", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-768", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1459", rating: "GROW LIGHTING / 43 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
