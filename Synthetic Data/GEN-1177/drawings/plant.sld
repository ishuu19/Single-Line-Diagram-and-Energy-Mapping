sld "GEN-1177 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-499", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1627", rating: "38240 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-323", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-726", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1454", rating: "DISTRIBUTION FEEDER / 886 kW"]
f2cb = breaker [label: "CB-387", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-702", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f2pr = recloser [label: "CB-397", rating: "250 A"]
f2pnl = hub [label: "FD-973", rating: "3P+N"]
f2l1ld = load [label: "PNL-1412", rating: "STATION SERVICE / 62 kW"]
f2l2ld = load [label: "PNL-1480", rating: "DISTRIBUTION FEEDER / 994 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pr
f2pr -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
