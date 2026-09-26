sld "GEN-0243 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-447", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1616", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-387", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-713", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-346", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1pnl = hub [label: "FD-902", rating: "3P+N"]
f1l1cb = breaker [label: "CB-381", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1113", rating: "21 kW / COMP"]
f1l2ld = load [label: "PNL-1473", rating: "UTILITY PANEL / 23 kW"]
f2cb = breaker [label: "CB-341", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-704", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-347", rating: "MCCB / 25 A / 3P"]
f2l1m = motor [label: "MTR-1128", rating: "10 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
