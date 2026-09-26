sld "GEN-0148 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-405", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-346", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-757", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
srcA2 = utility [label: "12.47kV STANDBY", voltage: "12.47kV"]
txA2 = transformer_yd [label: "TX-1650", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA2 = breaker [label: "CB-359", rating: "MCCB / 1000 A / 3P"]
mctA2 = ct [label: "TA-758", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1cb = breaker [label: "CB-303", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-721", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1pnl = hub [label: "FD-965", rating: "3P+N"]
f1l1ld = load [label: "PNL-1416", rating: "SHOP LIGHTING / 19 kW"]
f1l2ld = load [label: "PNL-1483", rating: "SHOP AUXILIARIES / 20 kW"]
f2cb = breaker [label: "CB-385", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-725", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1461", rating: "AUXILIARY PANEL / 34 kW"]
f2x = harmonic_filter [label: "HF-571", rating: "5th / 7th"]
f3cb = breaker [label: "CB-397", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-775", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1408", rating: "SHOP AUXILIARIES / 27 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
f2ct -> f2x
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
