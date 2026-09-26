sld "GEN-0106 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-414", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1638", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-377", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-704", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1cb = breaker [label: "CB-348", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-798", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-339", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1103", rating: "16 kW / COMP"]

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
