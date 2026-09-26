sld "GEN-0777 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-457", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1668", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-330", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1cb = breaker [label: "CB-333", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-725", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1423", rating: "SHELTER LIGHTING / 11 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
