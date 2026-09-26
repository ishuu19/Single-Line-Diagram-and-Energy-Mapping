sld "GEN-0032 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-488", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1680", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-303", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-783", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
busB = bus [label: "BUS-423", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_dy [label: "TX-1624", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-307", rating: "MCCB / 1000 A / 3P"]
mctB1 = ct [label: "TA-738", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
tie = bus_tie [label: "CB-345", rating: "1600 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1484", rating: "YARD LIGHTING / 26 kW"]
f2cb = breaker [label: "CB-399", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f2pnl = hub [label: "FD-914", rating: "3P+N"]
f2l1ld = load [label: "PNL-1495", rating: "YARD LIGHTING / 22 kW"]
f2l2ld = load [label: "PNL-1480", rating: "YARD LIGHTING / 32 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
