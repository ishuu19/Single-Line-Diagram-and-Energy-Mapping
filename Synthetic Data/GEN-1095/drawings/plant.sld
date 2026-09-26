sld "GEN-1095 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-479", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1665", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-375", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-718", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1cb = breaker [label: "CB-329", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-712", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1449", rating: "UTILITY PANEL / 26 kW"]
f2cb = breaker [label: "CB-320", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-794", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-305", rating: "MCCB / 80 A / 3P"]
f2l1m = motor [label: "MTR-1133", rating: "35 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
