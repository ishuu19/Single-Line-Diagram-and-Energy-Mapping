sld "GEN-1313 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-460", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1609", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-314", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-730", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "208Y/120V", rating: "260 kW"]
mcbA2 = breaker [label: "CB-316", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-737", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1cb = breaker [label: "CB-302", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1439", rating: "DOCK PANEL / 15 kW"]
f2cb = breaker [label: "CB-363", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-741", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1437", rating: "DOCK PANEL / 22 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
