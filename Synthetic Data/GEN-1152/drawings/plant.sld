sld "GEN-1152 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-471", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1678", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-307", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-766", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1cb = breaker [label: "CB-390", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-779", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f1pnl = hub [label: "FD-999", rating: "3P+N"]
f1l1ld = load [label: "PNL-1490", rating: "GROW LIGHTING / 42 kW"]
f1l2cb = breaker [label: "CB-383", rating: "MCCB / 40 A / 3P"]
f1l2drv = vfd [label: "DRV-857", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1137", rating: "18 kW / EF"]

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
mctA1 -> mpmA1
f1ct -> f1pm
