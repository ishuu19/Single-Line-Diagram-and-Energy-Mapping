sld "GEN-0228 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-421", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1641", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-307", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1cb = breaker [label: "CB-320", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-767", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1436", rating: "CELLAR PANEL / 14 kW"]
f2cb = breaker [label: "CB-319", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-791", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-396", rating: "MCCB / 160 A / 3P"]
f2l1m = motor [label: "MTR-1164", rating: "36 kW / COMP"]

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
