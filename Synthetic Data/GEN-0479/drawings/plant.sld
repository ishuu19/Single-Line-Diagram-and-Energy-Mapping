sld "GEN-0479 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-467", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1693", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-316", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1cb = breaker [label: "CB-359", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-747", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1417", rating: "COMMON AREA LIGHTING / 32 kW"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-783", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1175", rating: "13 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
