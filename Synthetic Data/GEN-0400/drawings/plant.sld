sld "GEN-0400 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-446", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1613", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-756", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1cb = breaker [label: "CB-381", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1426", rating: "SHOP LIGHTING / 31 kW"]
f1x = harmonic_filter [label: "HF-591", rating: "5th / 7th"]
f2cb = breaker [label: "CB-354", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-702", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-307", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-856", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1128", rating: "55 kW / PROC"]
f3cb = breaker [label: "CB-316", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-793", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-348", rating: "MCCB / 50 A / 3P"]
f3l1m = motor [label: "MTR-1187", rating: "23 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
f1ct -> f1x
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
