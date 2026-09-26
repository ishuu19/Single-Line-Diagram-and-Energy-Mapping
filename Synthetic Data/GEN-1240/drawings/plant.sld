sld "GEN-1240 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-452", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1239", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1616", rating: "5980 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-313", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-723", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1cb = breaker [label: "CB-358", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-710", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1pr = fuse [label: "CB-335", rating: "100 A"]
f1pnl = hub [label: "FD-909", rating: "3P+N"]
f1l1ld = load [label: "PNL-1437", rating: "DISTRIBUTION FEEDER / 1158 kW"]
f1l2ld = load [label: "PNL-1452", rating: "STATION SERVICE / 134 kW"]
f2cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-790", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1403", rating: "STATION SERVICE / 146 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pr
f1pr -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
