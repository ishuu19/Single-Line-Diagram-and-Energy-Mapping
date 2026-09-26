sld "GEN-1131 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-411", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1286", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1672", rating: "19120 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-776", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
srcA2 = utility [label: "138kV STANDBY", voltage: "138kV"]
txA2 = transformer_yd [label: "TX-1693", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA2 = breaker [label: "CB-391", rating: "ACB / 2000 A / 3P"]
mctA2 = ct [label: "TA-788", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1cb = breaker [label: "CB-359", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-767", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1pr = sectionalizer [label: "CB-315", rating: "100 A"]
f1pnl = hub [label: "FD-930", rating: "3P+N"]
f1l1ld = load [label: "PNL-1467", rating: "STATION SERVICE / 96 kW"]
f1l2ld = load [label: "PNL-1476", rating: "DISTRIBUTION FEEDER / 829 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pr
f1pr -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
