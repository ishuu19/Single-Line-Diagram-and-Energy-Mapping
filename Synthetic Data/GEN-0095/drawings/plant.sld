sld "GEN-0095 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-495", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1650", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-382", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-728", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
busB = bus [label: "BUS-405", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_dy [label: "TX-1697", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-314", rating: "MCCB / 630 A / 3P"]
mctB1 = ct [label: "TA-779", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
tie = bus_tie [label: "CB-394", rating: "1000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-716", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-304", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1150", rating: "11 kW / COND"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-745", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1495", rating: "CELLAR PANEL / 21 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
