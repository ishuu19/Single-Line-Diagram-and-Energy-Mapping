sld "GEN-0721 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-474", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1689", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-345", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-790", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1406", rating: "HOUSE PANEL / 48 kW"]
f2cb = breaker [label: "CB-335", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f2pnl = hub [label: "FD-991", rating: "3P+N"]
f2l1cb = breaker [label: "CB-316", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1178", rating: "6 kW / EF"]
f2l2cb = breaker [label: "CB-347", rating: "MCCB / 25 A / 3P"]
f2l2m = motor [label: "MTR-1160", rating: "14 kW / EF"]
f3cb = breaker [label: "CB-368", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-756", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-321", rating: "MCCB / 25 A / 3P"]
f3l1m = motor [label: "MTR-1115", rating: "13 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
