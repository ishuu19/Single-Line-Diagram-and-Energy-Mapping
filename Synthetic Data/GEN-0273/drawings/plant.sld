sld "GEN-0273 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-462", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1626", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-308", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-786", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-714", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1441", rating: "SHOP LIGHTING / 21 kW"]
f2cb = breaker [label: "CB-398", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-787", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1466", rating: "SHOP LIGHTING / 24 kW"]
f3cb = breaker [label: "CB-387", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-794", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1467", rating: "PRESS FLOOR PANEL / 29 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
