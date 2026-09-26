sld "GEN-0606 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-467", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1670", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-390", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-760", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1cb = breaker [label: "CB-384", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-781", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-334", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1159", rating: "5 kW / EF"]
f2cb = breaker [label: "CB-380", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-796", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1404", rating: "HOUSE PANEL / 56 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
