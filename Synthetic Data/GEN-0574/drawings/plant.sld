sld "GEN-0574 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-442", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1660", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-322", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-779", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
srcA2 = utility [label: "22kV STANDBY", voltage: "22kV"]
txA2 = transformer_dy [label: "TX-1620", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-382", rating: "MCCB / 1000 A / 3P"]
mctA2 = ct [label: "TA-721", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1cb = breaker [label: "CB-314", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-705", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1415", rating: "PRESS FLOOR PANEL / 36 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
