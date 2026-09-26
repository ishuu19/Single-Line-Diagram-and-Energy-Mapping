sld "GEN-1474 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-471", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1680", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-304", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-769", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
busB = bus [label: "BUS-440", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_dy [label: "TX-1634", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-319", rating: "MCCB / 1600 A / 3P"]
mctB1 = ct [label: "TA-714", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
tie = bus_tie [label: "CB-344", rating: "630 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-326", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-767", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-383", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-834", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1132", rating: "37 kW / PROC"]
f2cb = breaker [label: "CB-330", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-734", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1444", rating: "PRESS FLOOR PANEL / 32 kW"]

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
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
