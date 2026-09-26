sld "GEN-1086 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-427", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1665", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-322", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-705", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-359", rating: "MCCB / 125 A / 3P"]
f1l1m = motor [label: "MTR-1183", rating: "55 kW / COMP"]
f2cb = breaker [label: "CB-328", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-786", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-315", rating: "MCCB / 80 A / 3P"]
f2l1m = motor [label: "MTR-1116", rating: "32 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
