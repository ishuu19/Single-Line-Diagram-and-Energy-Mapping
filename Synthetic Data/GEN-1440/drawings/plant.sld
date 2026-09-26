sld "GEN-1440 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-475", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1672", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-360", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-755", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1cb = breaker [label: "CB-351", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-740", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1pnl = hub [label: "FD-915", rating: "3P+N"]
f1l1ld = load [label: "PNL-1438", rating: "UTILITY PANEL / 23 kW"]
f1l2ld = load [label: "PNL-1451", rating: "UTILITY PANEL / 12 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
