sld "GEN-0370 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-465", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1649", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-348", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-731", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1cb = breaker [label: "CB-376", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-708", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1pnl = hub [label: "FD-900", rating: "3P+N"]
f1l1cb = breaker [label: "CB-327", rating: "MCCB / 400 A / 3P"]
f1l1m = motor [label: "MTR-1131", rating: "190 kW / BLOW"]
f1l2ld = load [label: "PNL-1462", rating: "MCC AUXILIARY BOARD / 52 kW"]
f2cb = breaker [label: "CB-320", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-734", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-324", rating: "MCCB / 320 A / 3P"]
f2l1m = motor [label: "MTR-1179", rating: "159 kW / BLOW"]
f2x = capacitor_bank [label: "CAP-647", rating: "88 kVAR"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
f2ct -> f2x
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
