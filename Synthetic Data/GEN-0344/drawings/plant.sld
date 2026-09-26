sld "GEN-0344 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-480", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-367", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-769", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-710", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-313", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1116", rating: "8 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
