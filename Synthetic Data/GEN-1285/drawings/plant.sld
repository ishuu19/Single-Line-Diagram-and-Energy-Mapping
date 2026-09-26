sld "GEN-1285 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-424", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1600", rating: "38240 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-307", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-795", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-376", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1pr = recloser [label: "CB-371", rating: "250 A"]
f1l1ld = load [label: "PNL-1434", rating: "DISTRIBUTION FEEDER / 612 kW"]
f2cb = breaker [label: "CB-306", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f2pr = sectionalizer [label: "CB-315", rating: "250 A"]
f2pnl = hub [label: "FD-901", rating: "3P+N"]
f2l1ld = load [label: "PNL-1483", rating: "STATION SERVICE / 139 kW"]
f2l2ld = load [label: "PNL-1400", rating: "STATION SERVICE / 102 kW"]
f3cb = breaker [label: "CB-352", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-791", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1468", rating: "STATION SERVICE / 78 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pr
f1pr -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pr
f2pr -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
