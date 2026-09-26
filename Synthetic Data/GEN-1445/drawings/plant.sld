sld "GEN-1445 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-457", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1610", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-380", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-749", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 599 kW", voltage: "208Y/120V"]
mcbA2 = breaker [label: "CB-301", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-701", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1cb = breaker [label: "CB-383", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-733", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1484", rating: "SITE LIGHTING / 22 kW"]
f2cb = breaker [label: "CB-395", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-770", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1494", rating: "SITE LIGHTING / 23 kW"]
f3cb = breaker [label: "CB-314", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-726", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1403", rating: "SITE LIGHTING / 31 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
