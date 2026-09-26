sld "GEN-1141 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-408", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-371", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
busB = bus [label: "BUS-418", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1250 kW"]
mcbB1 = breaker [label: "CB-359", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-794", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
tie = ats [label: "CB-308", rating: "1000 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-334", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-723", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1494", rating: "AUXILIARY PANEL / 12 kW"]
f2cb = breaker [label: "CB-380", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-743", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1462", rating: "COMMON AREA LIGHTING / 40 kW"]
f3cb = breaker [label: "CB-375", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-791", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f3pnl = hub [label: "FD-936", rating: "3P+N"]
f3l1ld = load [label: "PNL-1453", rating: "RISER PANEL / 86 kW"]
f3l2ld = load [label: "PNL-1435", rating: "RISER PANEL / 60 kW"]

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
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
