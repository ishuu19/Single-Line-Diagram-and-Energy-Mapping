sld "GEN-1344 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-420", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1616", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-392", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1cb = breaker [label: "CB-340", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-718", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1462", rating: "SHOP LIGHTING / 24 kW"]
f1x = harmonic_filter [label: "HF-500", rating: "5th / 7th"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
f1ct -> f1x
mctA1 -> mpmA1
f1ct -> f1pm
