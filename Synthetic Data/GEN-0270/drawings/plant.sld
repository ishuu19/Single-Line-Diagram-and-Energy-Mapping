sld "GEN-0270 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-497", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1661", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-309", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-796", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1cb = breaker [label: "CB-353", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-770", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1439", rating: "CONTROL PANEL / 13 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
