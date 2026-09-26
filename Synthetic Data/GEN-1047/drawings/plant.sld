sld "GEN-1047 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-495", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1682", rating: "15060 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-313", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-743", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1cb = breaker [label: "CB-368", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-727", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1pr = recloser [label: "CB-301", rating: "400 A"]
f1pnl = hub [label: "FD-964", rating: "3P+N"]
f1l1ld = load [label: "PNL-1439", rating: "STATION SERVICE / 83 kW"]
f1l2ld = load [label: "PNL-1444", rating: "DISTRIBUTION FEEDER / 465 kW"]
f2cb = breaker [label: "CB-397", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-723", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f2pr = fuse [label: "CB-329", rating: "100 A"]
f2l1ld = load [label: "PNL-1434", rating: "STATION SERVICE / 115 kW"]
f3cb = breaker [label: "CB-304", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-710", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f3pr = recloser [label: "CB-340", rating: "160 A"]
f3pnl = hub [label: "FD-948", rating: "3P+N"]
f3l1ld = load [label: "PNL-1440", rating: "STATION SERVICE / 115 kW"]
f3l2ld = load [label: "PNL-1407", rating: "STATION SERVICE / 89 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pr
f1pr -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pr
f2pr -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pr
f3pr -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
