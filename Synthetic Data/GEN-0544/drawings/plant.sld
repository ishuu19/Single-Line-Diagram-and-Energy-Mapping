sld "GEN-0544 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-483", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1651", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-378", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-775", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1cb = breaker [label: "CB-377", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-706", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-345", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-834", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1159", rating: "17 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
