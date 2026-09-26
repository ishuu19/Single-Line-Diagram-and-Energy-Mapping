sld "GEN-0473 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-418", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1600", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-321", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1cb = breaker [label: "CB-390", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-722", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1489", rating: "DOCK LIGHTING / 24 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
