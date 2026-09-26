sld "GEN-1235 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-430", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1658", rating: "2080 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 2500 A / 3P"]
mctA1 = ct [label: "TA-791", rating: "3 CTs / 2500/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1cb = breaker [label: "CB-324", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-773", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1pnl = hub [label: "FD-984", rating: "3P+N"]
f1l1ld = load [label: "PNL-1456", rating: "AUXILIARY PANEL / 283 kW"]
f1l2ld = load [label: "PNL-1440", rating: "AUXILIARY PANEL / 353 kW"]
f1x = harmonic_filter [label: "HF-523", rating: "5th / 7th"]
f2cb = breaker [label: "CB-308", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-714", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f2pnl = hub [label: "FD-965", rating: "3P+N"]
f2l1ld = load [label: "PNL-1434", rating: "AUXILIARY PANEL / 328 kW"]
f2l2cb = breaker [label: "CB-307", rating: "MCCB / 200 A / 3P"]
f2l2m = motor [label: "MTR-1189", rating: "106 kW / BLOW"]
f3cb = breaker [label: "CB-378", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-713", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1413", rating: "AUXILIARY PANEL / 302 kW"]
f3x = capacitor_bank [label: "CAP-654", rating: "83 kVAR"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
f1pnl -> f1x
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
f3ct -> f3x
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
