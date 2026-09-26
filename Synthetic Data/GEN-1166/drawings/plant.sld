sld "GEN-1166 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-488", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1633", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-332", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-779", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1cb = breaker [label: "CB-321", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-722", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1pnl = hub [label: "FD-970", rating: "3P+N"]
f1l1ld = load [label: "PNL-1453", rating: "DOCK PANEL / 23 kW"]
f1l2ld = load [label: "PNL-1424", rating: "DOCK PANEL / 27 kW"]
f2cb = breaker [label: "CB-361", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-711", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-307", rating: "MCCB / 40 A / 3P"]
f2l1m = motor [label: "MTR-1136", rating: "16 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
