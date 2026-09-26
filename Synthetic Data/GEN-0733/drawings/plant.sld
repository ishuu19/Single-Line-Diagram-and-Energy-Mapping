sld "GEN-0733 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-457", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1699", rating: "1730 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-352", rating: "ACB / 2500 A / 3P"]
mctA1 = ct [label: "TA-795", rating: "3 CTs / 2500/5 A"]
mpmA1 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-790", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1pnl = hub [label: "FD-965", rating: "3P+N"]
f1l1ld = load [label: "PNL-1427", rating: "MCC AUXILIARY BOARD / 85 kW"]
f1l2cb = breaker [label: "CB-302", rating: "MCCB / 400 A / 3P"]
f1l2m = motor [label: "MTR-1115", rating: "168 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
