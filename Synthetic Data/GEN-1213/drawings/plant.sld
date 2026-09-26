sld "GEN-1213 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-442", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1601", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-387", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1cb = breaker [label: "CB-305", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1415", rating: "COMMON AREA LIGHTING / 29 kW"]
f2cb = breaker [label: "CB-330", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-735", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f2pnl = hub [label: "FD-957", rating: "3P+N"]
f2l1ld = load [label: "PNL-1426", rating: "RISER PANEL / 67 kW"]
f2l2ld = load [label: "PNL-1443", rating: "COMMON AREA LIGHTING / 41 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
