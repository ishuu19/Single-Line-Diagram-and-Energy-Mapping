sld "GEN-0763 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-449", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1691", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-764", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1cb = breaker [label: "CB-335", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-790", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1486", rating: "SHORE POWER PANEL / 70 kW"]
f2cb = breaker [label: "CB-344", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-795", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1408", rating: "SHORE POWER PANEL / 39 kW"]
f3cb = breaker [label: "CB-338", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-745", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f3pnl = hub [label: "FD-915", rating: "3P+N"]
f3l1ld = load [label: "PNL-1415", rating: "DOCK LIGHTING / 15 kW"]
f3l2cb = breaker [label: "CB-320", rating: "MCCB / 20 A / 3P"]
f3l2m = motor [label: "MTR-1105", rating: "8 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
