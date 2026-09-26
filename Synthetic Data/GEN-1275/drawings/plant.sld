sld "GEN-1275 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-455", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1684", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-382", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-704", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1cb = breaker [label: "CB-385", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-324", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1107", rating: "11 kW / EF"]

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
