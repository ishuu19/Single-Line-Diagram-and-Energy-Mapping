sld "GEN-0089 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-490", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1644", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-327", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-754", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-763", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-346", rating: "MCCB / 80 A / 3P"]
f1l1m = motor [label: "MTR-1173", rating: "36 kW / COMP"]
f2cb = breaker [label: "CB-353", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-706", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-340", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1124", rating: "27 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
