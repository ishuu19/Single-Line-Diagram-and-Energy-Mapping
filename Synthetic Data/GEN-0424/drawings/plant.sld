sld "GEN-0424 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-493", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1613", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-369", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-758", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "250 kW"]
mcbA2 = breaker [label: "CB-373", rating: "ACB / 400 A / 3P"]
mctA2 = ct [label: "TA-703", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-781", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1468", rating: "AUXILIARY PANEL / 58 kW"]
f2cb = breaker [label: "CB-324", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-707", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1455", rating: "AUXILIARY PANEL / 37 kW"]
f3cb = breaker [label: "CB-398", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-776", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f3pnl = hub [label: "FD-949", rating: "3P+N"]
f3l1ld = load [label: "PNL-1477", rating: "AUXILIARY PANEL / 48 kW"]
f3l2ld = load [label: "PNL-1439", rating: "AUXILIARY PANEL / 23 kW"]
f3x = harmonic_filter [label: "HF-559", rating: "5th / 7th"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
f3pnl -> f3x
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
