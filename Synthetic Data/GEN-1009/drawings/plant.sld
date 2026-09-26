sld "GEN-1009 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-493", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1608", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-364", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-772", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
srcA2 = utility [label: "20kV STANDBY", voltage: "20kV"]
txA2 = transformer_dy [label: "TX-1613", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-358", rating: "MCCB / 1000 A / 3P"]
mctA2 = ct [label: "TA-760", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1cb = breaker [label: "CB-318", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1480", rating: "DOCK PANEL / 30 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
