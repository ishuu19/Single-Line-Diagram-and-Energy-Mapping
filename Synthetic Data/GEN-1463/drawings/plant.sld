sld "GEN-1463 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-426", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-303", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-703", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
busB = bus [label: "BUS-425", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1000 kW"]
mcbB1 = breaker [label: "CB-319", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-738", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
tie = ats [label: "CB-308", rating: "1600 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-746", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1483", rating: "PACKAGING PANEL / 16 kW"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-707", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f2pnl = hub [label: "FD-979", rating: "3P+N"]
f2l1ld = load [label: "PNL-1458", rating: "PACKAGING PANEL / 12 kW"]
f2l2ld = load [label: "PNL-1414", rating: "AUXILIARY PANEL / 36 kW"]
f3cb = breaker [label: "CB-345", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-714", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1418", rating: "AUXILIARY PANEL / 28 kW"]

srcA1 -> mcbA1
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
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
