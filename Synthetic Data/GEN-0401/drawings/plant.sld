sld "GEN-0401 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-438", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1652", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-383", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1cb = breaker [label: "CB-306", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-708", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1416", rating: "CONTROL PANEL / 11 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
