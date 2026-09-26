sld "GEN-0237 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-410", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1679", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-328", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1cb = breaker [label: "CB-394", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1477", rating: "YARD LIGHTING / 34 kW"]
f2cb = breaker [label: "CB-329", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-705", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f2pnl = hub [label: "FD-944", rating: "3P+N"]
f2l1ld = load [label: "PNL-1444", rating: "REEFER RACK PANEL / 143 kW"]
f2l2cb = breaker [label: "CB-312", rating: "MCCB / 25 A / 3P"]
f2l2m = motor [label: "MTR-1155", rating: "12 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
