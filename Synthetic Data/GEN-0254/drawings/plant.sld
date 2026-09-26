sld "GEN-0254 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-401", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1621", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-354", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
srcA2 = utility [label: "6.6kV STANDBY", voltage: "6.6kV"]
txA2 = transformer_dy [label: "TX-1691", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-333", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-778", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1cb = breaker [label: "CB-328", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-723", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1462", rating: "SHOP AUXILIARIES / 45 kW"]
f2cb = breaker [label: "CB-361", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-790", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1457", rating: "SHOP LIGHTING / 22 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
