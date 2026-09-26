sld "GEN-1211 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-413", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1607", rating: "5980 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-315", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-753", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
srcA2 = utility [label: "138kV STANDBY", voltage: "138kV"]
txA2 = transformer_yd [label: "TX-1699", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA2 = breaker [label: "CB-312", rating: "ACB / 2000 A / 3P"]
mctA2 = ct [label: "TA-792", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f1cb = breaker [label: "CB-377", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-741", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1435", rating: "DISTRIBUTION FEEDER / 728 kW"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-731", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f2pnl = hub [label: "FD-931", rating: "3P+N"]
f2l1ld = load [label: "PNL-1403", rating: "DISTRIBUTION FEEDER / 464 kW"]
f2l2ld = load [label: "PNL-1447", rating: "STATION SERVICE / 80 kW"]

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
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
