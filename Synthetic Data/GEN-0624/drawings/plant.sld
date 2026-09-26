sld "GEN-0624 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-461", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1658", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-342", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-771", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1cb = breaker [label: "CB-384", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-741", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-361", rating: "MCCB / 125 A / 3P"]
f1l1m = motor [label: "MTR-1109", rating: "54 kW / COMP"]
f2cb = breaker [label: "CB-368", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-775", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-369", rating: "MCCB / 100 A / 3P"]
f2l1m = motor [label: "MTR-1196", rating: "48 kW / COMP"]
f3cb = breaker [label: "CB-387", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-742", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-325", rating: "MCCB / 100 A / 3P"]
f3l1drv = vfd [label: "DRV-865", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1118", rating: "41 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
