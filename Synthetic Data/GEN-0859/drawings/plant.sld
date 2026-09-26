sld "GEN-0859 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-436", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1605", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-391", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-783", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f1cb = breaker [label: "CB-309", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1471", rating: "RISER PANEL / 89 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
