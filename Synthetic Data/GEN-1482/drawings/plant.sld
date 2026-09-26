sld "GEN-1482 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-427", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1661", rating: "5980 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-339", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1cb = breaker [label: "CB-308", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-728", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1472", rating: "DISTRIBUTION FEEDER / 1015 kW"]
f2cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-716", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1470", rating: "DISTRIBUTION FEEDER / 862 kW"]
f3cb = breaker [label: "CB-366", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-702", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f3pr = recloser [label: "CB-322", rating: "100 A"]
f3pnl = hub [label: "FD-988", rating: "3P+N"]
f3l1ld = load [label: "PNL-1487", rating: "STATION SERVICE / 118 kW"]
f3l2ld = load [label: "PNL-1432", rating: "STATION SERVICE / 136 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pr
f3pr -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
