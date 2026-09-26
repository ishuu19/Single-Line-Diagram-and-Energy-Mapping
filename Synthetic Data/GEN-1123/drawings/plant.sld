sld "GEN-1123 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-461", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1631", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-385", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-702", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1cb = breaker [label: "CB-310", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1461", rating: "GROW LIGHTING / 38 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
