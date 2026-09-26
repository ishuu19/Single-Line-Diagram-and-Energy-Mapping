sld "GEN-0445 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-431", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1622", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-387", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-716", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1cb = breaker [label: "CB-367", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1425", rating: "YARD LIGHTING / 32 kW"]
f2cb = breaker [label: "CB-323", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-735", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f2pnl = hub [label: "FD-972", rating: "3P+N"]
f2l1cb = breaker [label: "CB-329", rating: "MCCB / 25 A / 3P"]
f2l1m = motor [label: "MTR-1134", rating: "11 kW / EF"]
f2l2ld = load [label: "PNL-1412", rating: "YARD LIGHTING / 31 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
