sld "GEN-0576 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-424", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1613", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-358", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1cb = breaker [label: "CB-300", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1458", rating: "SHOP AUXILIARIES / 20 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
