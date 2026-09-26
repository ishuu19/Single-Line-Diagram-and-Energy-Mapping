sld "GEN-0867 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-436", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1606", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-318", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-744", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-394", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-369", rating: "MCCB / 125 A / 3P"]
f1l1m = motor [label: "MTR-1109", rating: "32 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
