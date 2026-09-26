sld "GEN-0266 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-413", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1687", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-369", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1cb = breaker [label: "CB-324", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1pnl = hub [label: "FD-938", rating: "3P+N"]
f1l1ld = load [label: "PNL-1459", rating: "RECTIFIER PDU / 45 kW"]
f1l2ld = load [label: "PNL-1436", rating: "SHELTER LIGHTING / 4 kW"]
f2cb = breaker [label: "CB-353", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-708", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1477", rating: "RECTIFIER PDU / 41 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
