sld "GEN-1270 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-421", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1616", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-394", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-348", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-343", rating: "MCCB / 100 A / 3P"]
f1l1m = motor [label: "MTR-1188", rating: "50 kW / COMP"]
f2cb = breaker [label: "CB-374", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-711", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-315", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1124", rating: "27 kW / COMP"]
f3cb = breaker [label: "CB-352", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-722", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-329", rating: "MCCB / 50 A / 3P"]
f3l1m = motor [label: "MTR-1199", rating: "28 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
