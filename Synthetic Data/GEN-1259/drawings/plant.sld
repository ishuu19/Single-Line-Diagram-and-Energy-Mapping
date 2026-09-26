sld "GEN-1259 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-480", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1665", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-397", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-757", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
busB = bus [label: "BUS-484", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "500 kW"]
mcbB1 = breaker [label: "CB-359", rating: "MCCB / 800 A / 3P"]
mctB1 = ct [label: "TA-765", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
tie = ats [label: "CB-370", rating: "630 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-302", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1408", rating: "AUXILIARY PANEL / 24 kW"]
f2cb = breaker [label: "CB-337", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-771", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1421", rating: "CLASSROOM LIGHTING / 47 kW"]
f3cb = breaker [label: "CB-306", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-743", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1467", rating: "AUXILIARY PANEL / 17 kW"]

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
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
