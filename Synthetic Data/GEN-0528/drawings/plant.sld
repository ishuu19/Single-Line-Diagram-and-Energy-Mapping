sld "GEN-0528 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-418", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1602", rating: "5980 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-372", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-784", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f1cb = breaker [label: "CB-311", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1pnl = hub [label: "FD-969", rating: "3P+N"]
f1l1ld = load [label: "PNL-1436", rating: "DISTRIBUTION FEEDER / 884 kW"]
f1l2ld = load [label: "PNL-1464", rating: "STATION SERVICE / 87 kW"]
f2cb = breaker [label: "CB-323", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-707", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1418", rating: "STATION SERVICE / 111 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
