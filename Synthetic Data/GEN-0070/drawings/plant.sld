sld "GEN-0070 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-464", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1691", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-396", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f1cb = breaker [label: "CB-373", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1453", rating: "UTILITY PANEL / 13 kW"]
f2cb = breaker [label: "CB-387", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-772", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1467", rating: "UTILITY PANEL / 20 kW"]
f3cb = breaker [label: "CB-348", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-708", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-301", rating: "MCCB / 100 A / 3P"]
f3l1m = motor [label: "MTR-1129", rating: "21 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
