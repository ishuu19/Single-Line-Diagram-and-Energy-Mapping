sld "GEN-0429 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-407", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1610", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-395", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-781", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
busB = bus [label: "BUS-480", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1664", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-397", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-704", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
tie = bus_tie [label: "CB-324", rating: "2000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-382", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-720", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-371", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1110", rating: "18 kW / COMP"]
f2cb = breaker [label: "CB-375", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-784", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-359", rating: "MCCB / 25 A / 3P"]
f2l1m = motor [label: "MTR-1108", rating: "11 kW / COND"]

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
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
