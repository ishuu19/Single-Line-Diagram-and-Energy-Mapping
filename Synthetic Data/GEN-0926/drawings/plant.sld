sld "GEN-0926 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-495", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1684", rating: "690 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-366", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-789", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1cb = breaker [label: "CB-321", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-728", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1497", rating: "UTILITY PANEL / 12 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
