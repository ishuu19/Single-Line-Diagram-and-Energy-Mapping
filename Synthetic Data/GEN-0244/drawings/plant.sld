sld "GEN-0244 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-444", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1695", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-356", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-765", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
busB = bus [label: "BUS-458", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "150 kW"]
mcbB1 = breaker [label: "CB-351", rating: "MCCB / 250 A / 3P"]
mctB1 = ct [label: "TA-745", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
tie = ats [label: "CB-354", rating: "630 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-392", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-756", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1413", rating: "SHELTER LIGHTING / 11 kW"]
f2cb = breaker [label: "CB-352", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-732", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1446", rating: "RECTIFIER PDU / 25 kW"]
f3cb = breaker [label: "CB-334", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-752", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1472", rating: "AUXILIARY PANEL / 22 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
