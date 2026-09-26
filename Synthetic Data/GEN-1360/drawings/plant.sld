sld "GEN-1360 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-418", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1676", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-376", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
busB = bus [label: "BUS-422", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_dy [label: "TX-1608", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-389", rating: "MCCB / 1600 A / 3P"]
mctB1 = ct [label: "TA-716", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
tie = bus_tie [label: "CB-353", rating: "2000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-708", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1496", rating: "SHOP LIGHTING / 18 kW"]
f2cb = breaker [label: "CB-385", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-788", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1472", rating: "SHOP LIGHTING / 20 kW"]
f3cb = breaker [label: "CB-332", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-736", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1423", rating: "SHOP LIGHTING / 21 kW"]

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
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
