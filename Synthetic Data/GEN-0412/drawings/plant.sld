sld "GEN-0412 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-491", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1690", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-331", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-704", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1cb = breaker [label: "CB-363", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1pnl = hub [label: "FD-947", rating: "3P+N"]
f1l1ld = load [label: "PNL-1499", rating: "LIFE SAFETY BRANCH / 60 kW"]
f1l2ld = load [label: "PNL-1435", rating: "WARD LIGHTING / 32 kW"]
f2cb = breaker [label: "CB-340", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f2pnl = hub [label: "FD-912", rating: "3P+N"]
f2l1ld = load [label: "PNL-1466", rating: "CRITICAL BRANCH / 60 kW"]
f2l2ld = load [label: "PNL-1420", rating: "WARD LIGHTING / 20 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
