sld "GEN-1019 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-464", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1600", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-367", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-744", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-743", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1496", rating: "DOCK PANEL / 35 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
