sld "GEN-0987 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-443", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1200", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1655", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-780", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1cb = breaker [label: "CB-365", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1445", rating: "STATION SERVICE / 92 kW"]
f2cb = breaker [label: "CB-362", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f2pnl = hub [label: "FD-932", rating: "3P+N"]
f2l1ld = load [label: "PNL-1419", rating: "DISTRIBUTION FEEDER / 859 kW"]
f2l2ld = load [label: "PNL-1490", rating: "STATION SERVICE / 102 kW"]
f3cb = breaker [label: "CB-347", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-769", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f3pr = sectionalizer [label: "CB-391", rating: "100 A"]
f3l1ld = load [label: "PNL-1421", rating: "DISTRIBUTION FEEDER / 1043 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pr
f3pr -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
