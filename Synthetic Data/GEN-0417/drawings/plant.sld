sld "GEN-0417 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-450", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1621", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-395", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1cb = breaker [label: "CB-344", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-784", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1pnl = hub [label: "FD-945", rating: "3P+N"]
f1l1ld = load [label: "PNL-1468", rating: "YARD LIGHTING / 19 kW"]
f1l2ld = load [label: "PNL-1439", rating: "REEFER RACK PANEL / 106 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
