sld "GEN-0442 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-438", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1604", rating: "38240 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-319", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-766", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1cb = breaker [label: "CB-300", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1416", rating: "DISTRIBUTION FEEDER / 885 kW"]
f2cb = breaker [label: "CB-304", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-742", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f2pnl = hub [label: "FD-939", rating: "3P+N"]
f2l1ld = load [label: "PNL-1414", rating: "STATION SERVICE / 66 kW"]
f2l2ld = load [label: "PNL-1468", rating: "STATION SERVICE / 149 kW"]
f3cb = breaker [label: "CB-349", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-703", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1417", rating: "STATION SERVICE / 147 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
