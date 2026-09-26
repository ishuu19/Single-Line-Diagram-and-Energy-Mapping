sld "GEN-1111 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-494", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1606", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-363", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-747", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
busB = bus [label: "BUS-460", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "250 kW"]
mcbB1 = breaker [label: "CB-389", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-754", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
tie = ats [label: "CB-324", rating: "800 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-373", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-790", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1424", rating: "AUXILIARY PANEL / 16 kW"]
f2cb = breaker [label: "CB-332", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-772", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-367", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1147", rating: "15 kW / EF"]
f3cb = breaker [label: "CB-308", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-777", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1451", rating: "AUXILIARY PANEL / 16 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
