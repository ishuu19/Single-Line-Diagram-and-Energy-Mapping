sld "GEN-0205 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-478", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1641", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-798", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 435 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-302", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-733", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1498", rating: "GROW LIGHTING / 57 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
