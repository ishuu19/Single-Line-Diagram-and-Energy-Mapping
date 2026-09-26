sld "GEN-0101 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-415", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1683", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-312", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-742", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 295 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-310", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-750", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1474", rating: "SITE LIGHTING / 19 kW"]
f2cb = breaker [label: "CB-381", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-710", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1401", rating: "ACADEMIC BLOCK PANEL / 77 kW"]
f3cb = breaker [label: "CB-380", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-722", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f3pnl = hub [label: "FD-967", rating: "3P+N"]
f3l1ld = load [label: "PNL-1442", rating: "AUXILIARY PANEL / 35 kW"]
f3l2ld = load [label: "PNL-1431", rating: "ACADEMIC BLOCK PANEL / 83 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
