sld "GEN-1337 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-440", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1691", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-327", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1cb = breaker [label: "CB-308", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-796", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1462", rating: "LIFE SAFETY BRANCH / 31 kW"]
f2cb = breaker [label: "CB-329", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-784", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f2pnl = hub [label: "FD-941", rating: "3P+N"]
f2l1ld = load [label: "PNL-1469", rating: "LIFE SAFETY BRANCH / 55 kW"]
f2l2ld = load [label: "PNL-1423", rating: "LIFE SAFETY BRANCH / 48 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
