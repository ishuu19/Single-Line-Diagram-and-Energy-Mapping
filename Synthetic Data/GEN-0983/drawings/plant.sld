sld "GEN-0983 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-488", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1699", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-369", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-760", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f1cb = breaker [label: "CB-336", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-705", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1498", rating: "REEFER RACK PANEL / 100 kW"]
f2cb = breaker [label: "CB-398", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-774", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f2pnl = hub [label: "FD-985", rating: "3P+N"]
f2l1ld = load [label: "PNL-1499", rating: "YARD LIGHTING / 30 kW"]
f2l2ld = load [label: "PNL-1484", rating: "REEFER RACK PANEL / 105 kW"]
f3cb = breaker [label: "CB-397", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-718", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1434", rating: "YARD LIGHTING / 15 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
