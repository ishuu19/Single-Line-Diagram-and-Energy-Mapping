sld "GEN-0646 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-441", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1624", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-352", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-703", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1cb = breaker [label: "CB-385", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-748", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1420", rating: "REEFER RACK PANEL / 135 kW"]
f2cb = breaker [label: "CB-309", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f2pnl = hub [label: "FD-910", rating: "3P+N"]
f2l1cb = breaker [label: "CB-375", rating: "MCCB / 25 A / 3P"]
f2l1m = motor [label: "MTR-1109", rating: "10 kW / EF"]
f2l2ld = load [label: "PNL-1493", rating: "YARD LIGHTING / 33 kW"]

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
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
