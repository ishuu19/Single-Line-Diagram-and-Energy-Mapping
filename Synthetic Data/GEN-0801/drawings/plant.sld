sld "GEN-0801 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-476", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1629", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-362", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-300", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-744", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1463", rating: "PRESS FLOOR PANEL / 29 kW"]
f2cb = breaker [label: "CB-344", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-791", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1436", rating: "SHOP LIGHTING / 11 kW"]
f3cb = breaker [label: "CB-398", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-735", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1491", rating: "PRESS FLOOR PANEL / 30 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
