sld "GEN-1433 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-450", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1643", rating: "38240 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-339", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-728", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1cb = breaker [label: "CB-305", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-742", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1pr = sectionalizer [label: "CB-393", rating: "100 A"]
f1pnl = hub [label: "FD-969", rating: "3P+N"]
f1l1ld = load [label: "PNL-1440", rating: "STATION SERVICE / 109 kW"]
f1l2ld = load [label: "PNL-1435", rating: "STATION SERVICE / 75 kW"]

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
mctA1 -> mpmA1
f1ct -> f1pm
