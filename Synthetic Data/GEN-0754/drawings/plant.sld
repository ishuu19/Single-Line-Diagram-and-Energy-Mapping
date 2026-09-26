sld "GEN-0754 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-440", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1238", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1627", rating: "23900 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-341", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
srcA2 = utility [label: "138kV STANDBY", voltage: "138kV"]
txA2 = transformer_yd [label: "TX-1698", rating: "5980 kVA", voltage: "138kV / 13.8kV"]
mcbA2 = breaker [label: "CB-308", rating: "ACB / 250 A / 3P"]
mctA2 = ct [label: "TA-791", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1cb = breaker [label: "CB-310", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-792", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1pnl = hub [label: "FD-947", rating: "3P+N"]
f1l1ld = load [label: "PNL-1451", rating: "DISTRIBUTION FEEDER / 741 kW"]
f1l2ld = load [label: "PNL-1475", rating: "DISTRIBUTION FEEDER / 406 kW"]
f2cb = breaker [label: "CB-393", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-762", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1499", rating: "DISTRIBUTION FEEDER / 624 kW"]

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
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
