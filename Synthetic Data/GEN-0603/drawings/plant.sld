sld "GEN-0603 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-435", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1608", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-328", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-788", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1cb = breaker [label: "CB-345", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-761", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1497", rating: "SHORE POWER PANEL / 51 kW"]
f2cb = breaker [label: "CB-303", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-784", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-350", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1155", rating: "6 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
