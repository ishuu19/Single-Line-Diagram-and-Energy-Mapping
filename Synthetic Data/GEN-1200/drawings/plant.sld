sld "GEN-1200 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-467", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1623", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-392", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1cb = breaker [label: "CB-326", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-712", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1pnl = hub [label: "FD-952", rating: "3P+N"]
f1l1ld = load [label: "PNL-1482", rating: "FLOOR LIGHTING / 75 kW"]
f1l2cb = breaker [label: "CB-369", rating: "MCCB / 32 A / 3P"]
f1l2m = motor [label: "MTR-1195", rating: "15 kW / EF"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-769", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f2pnl = hub [label: "FD-932", rating: "3P+N"]
f2l1ld = load [label: "PNL-1421", rating: "FLOOR LIGHTING / 68 kW"]
f2l2cb = breaker [label: "CB-321", rating: "MCCB / 50 A / 3P"]
f2l2drv = vfd [label: "DRV-892", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1191", rating: "22 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
