sld "GEN-0043 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-456", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-390", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "208Y/120V", rating: "130 kW"]
mcbA2 = breaker [label: "CB-367", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-757", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1cb = breaker [label: "CB-339", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-707", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1412", rating: "DOCK PANEL / 22 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
