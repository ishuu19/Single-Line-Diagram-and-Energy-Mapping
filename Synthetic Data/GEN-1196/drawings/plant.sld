sld "GEN-1196 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-470", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1678", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-358", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
busB = bus [label: "BUS-469", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "500 kW"]
mcbB1 = breaker [label: "CB-345", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-761", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
tie = ats [label: "CB-335", rating: "1600 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-302", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-794", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1408", rating: "COMMON AREA LIGHTING / 23 kW"]
f2cb = breaker [label: "CB-360", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-756", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1489", rating: "AUXILIARY PANEL / 9 kW"]
f3cb = breaker [label: "CB-357", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-770", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-350", rating: "MCCB / 32 A / 3P"]
f3l1m = motor [label: "MTR-1164", rating: "14 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
