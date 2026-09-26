sld "GEN-1400 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-469", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1631", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-306", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-747", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
srcA2 = utility [label: "11kV STANDBY", voltage: "11kV"]
mcbA2 = breaker [label: "CB-348", rating: "ACB / 400 A / 3P"]
mctA2 = ct [label: "TA-745", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1cb = breaker [label: "CB-368", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-355", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1122", rating: "11 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
