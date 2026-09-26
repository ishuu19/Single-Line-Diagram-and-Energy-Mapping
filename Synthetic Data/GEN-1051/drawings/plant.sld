sld "GEN-1051 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-405", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1639", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-343", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-717", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
busB = bus [label: "BUS-407", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_dy [label: "TX-1657", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-369", rating: "MCCB / 630 A / 3P"]
mctB1 = ct [label: "TA-776", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
tie = bus_tie [label: "CB-337", rating: "800 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-765", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1437", rating: "DOSING PANEL / 21 kW"]
f2cb = breaker [label: "CB-364", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-742", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1466", rating: "AUXILIARY PANEL / 53 kW"]
f3cb = breaker [label: "CB-392", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-709", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1473", rating: "AUXILIARY PANEL / 48 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
