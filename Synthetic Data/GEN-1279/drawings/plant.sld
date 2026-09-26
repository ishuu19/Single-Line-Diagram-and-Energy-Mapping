sld "GEN-1279 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-409", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1654", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-369", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-770", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1cb = breaker [label: "CB-394", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-743", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-392", rating: "MCCB / 100 A / 3P"]
f1l1m = motor [label: "MTR-1169", rating: "49 kW / COMP"]
f2cb = breaker [label: "CB-360", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-774", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1486", rating: "PACKAGING PANEL / 24 kW"]
f3cb = breaker [label: "CB-334", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-775", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1459", rating: "PACKAGING PANEL / 20 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
