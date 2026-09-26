sld "GEN-0529 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-486", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1649", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-367", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-705", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
busB = bus [label: "BUS-453", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
mcbB1 = breaker [label: "CB-382", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-752", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
tie = bus_tie [label: "CB-394", rating: "2000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-388", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-368", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1109", rating: "5 kW / EF"]
f2cb = breaker [label: "CB-323", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-715", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-305", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-881", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1103", rating: "11 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
