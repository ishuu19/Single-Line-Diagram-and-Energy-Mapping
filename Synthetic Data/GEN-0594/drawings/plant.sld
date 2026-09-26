sld "GEN-0594 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-460", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1645", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-395", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
srcA2 = utility [label: "22kV STANDBY", voltage: "22kV"]
txA2 = transformer_dy [label: "TX-1674", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-335", rating: "MCCB / 1000 A / 3P"]
mctA2 = ct [label: "TA-730", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1cb = breaker [label: "CB-306", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1477", rating: "SHORE POWER PANEL / 63 kW"]
f2cb = breaker [label: "CB-313", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-776", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-329", rating: "MCCB / 20 A / 3P"]
f2l1m = motor [label: "MTR-1103", rating: "9 kW / EF"]
f3cb = breaker [label: "CB-373", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-791", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1423", rating: "SHORE POWER PANEL / 49 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
