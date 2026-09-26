sld "GEN-1121 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-417", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1633", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-336", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-700", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1cb = breaker [label: "CB-381", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-706", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-399", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1176", rating: "21 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
