sld "GEN-1126 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-418", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1613", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-387", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-766", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
srcA2 = utility [label: "11kV STANDBY", voltage: "11kV"]
mcbA2 = breaker [label: "CB-316", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-725", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1444", rating: "AUXILIARY PANEL / 9 kW"]
f2cb = breaker [label: "CB-308", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-790", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1436", rating: "YARD LIGHTING / 17 kW"]
f3cb = breaker [label: "CB-396", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-754", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f3pnl = hub [label: "FD-962", rating: "3P+N"]
f3l1ld = load [label: "PNL-1476", rating: "AUXILIARY PANEL / 12 kW"]
f3l2ld = load [label: "PNL-1410", rating: "YARD LIGHTING / 35 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
