sld "GEN-0745 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-454", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1606", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-341", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-779", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-717", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-336", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1199", rating: "5 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
