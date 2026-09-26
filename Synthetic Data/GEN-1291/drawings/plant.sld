sld "GEN-1291 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-430", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1619", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-344", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-727", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1cb = breaker [label: "CB-366", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-738", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1pnl = hub [label: "FD-975", rating: "3P+N"]
f1l1ld = load [label: "PNL-1439", rating: "UTILITY PANEL / 19 kW"]
f1l2ld = load [label: "PNL-1490", rating: "UTILITY PANEL / 21 kW"]
f2cb = breaker [label: "CB-365", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-767", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1472", rating: "UTILITY PANEL / 29 kW"]
f3cb = breaker [label: "CB-383", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-753", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f3pnl = hub [label: "FD-991", rating: "3P+N"]
f3l1cb = breaker [label: "CB-356", rating: "MCCB / 16 A / 3P"]
f3l1m = motor [label: "MTR-1126", rating: "7 kW / EF"]
f3l2ld = load [label: "PNL-1406", rating: "UTILITY PANEL / 17 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
