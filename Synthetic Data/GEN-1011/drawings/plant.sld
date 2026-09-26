sld "GEN-1011 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-424", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1635", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-324", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-725", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_dy [label: "TX-1637", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-346", rating: "MCCB / 1600 A / 3P"]
mctA2 = ct [label: "TA-759", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1cb = breaker [label: "CB-381", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-718", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1pnl = hub [label: "FD-920", rating: "3P+N"]
f1l1cb = breaker [label: "CB-325", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1105", rating: "34 kW / COMP"]
f1l2cb = breaker [label: "CB-301", rating: "MCCB / 80 A / 3P"]
f1l2drv = vfd [label: "DRV-848", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1114", rating: "38 kW / PROC"]
f2cb = breaker [label: "CB-314", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-707", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-384", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1100", rating: "15 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
