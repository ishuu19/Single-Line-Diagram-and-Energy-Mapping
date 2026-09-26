sld "GEN-1173 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-433", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1636", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-349", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-785", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-757", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1pnl = hub [label: "FD-923", rating: "3P+N"]
f1l1ld = load [label: "PNL-1479", rating: "CONTROL PANEL / 10 kW"]
f1l2cb = breaker [label: "CB-360", rating: "MCCB / 63 A / 3P"]
f1l2m = motor [label: "MTR-1144", rating: "28 kW / RWP"]
f2cb = breaker [label: "CB-317", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-738", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-339", rating: "MCCB / 32 A / 3P"]
f2l1drv = vfd [label: "DRV-896", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1178", rating: "13 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
