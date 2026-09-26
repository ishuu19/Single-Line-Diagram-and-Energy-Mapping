sld "GEN-0626 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-439", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1619", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-382", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
busB = bus [label: "BUS-475", voltage: "208Y/120V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "208Y/120V", rating: "520 kW"]
mcbB1 = breaker [label: "CB-320", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-768", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
tie = ats [label: "CB-313", rating: "2000 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-363", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-708", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1411", rating: "SHORE POWER PANEL / 58 kW"]
f2cb = breaker [label: "CB-384", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-750", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1426", rating: "SHORE POWER PANEL / 61 kW"]
f3cb = breaker [label: "CB-397", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-717", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1400", rating: "DOCK LIGHTING / 11 kW"]

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
busB -> f2cb [cable: "3#4 AWG"]
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
