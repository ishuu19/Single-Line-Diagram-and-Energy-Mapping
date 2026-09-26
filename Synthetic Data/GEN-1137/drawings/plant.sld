sld "GEN-1137 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-412", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1662", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-338", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-762", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
busB = bus [label: "BUS-428", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "150 kW"]
mcbB1 = breaker [label: "CB-329", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-706", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
tie = ats [label: "CB-348", rating: "800 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-330", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-796", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1443", rating: "SHORE POWER PANEL / 76 kW"]
f2cb = breaker [label: "CB-378", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-772", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1436", rating: "DOCK LIGHTING / 14 kW"]
f3cb = breaker [label: "CB-373", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-737", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1485", rating: "DOCK LIGHTING / 25 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
