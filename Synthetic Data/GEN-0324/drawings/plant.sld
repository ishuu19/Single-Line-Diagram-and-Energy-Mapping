sld "GEN-0324 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-436", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1655", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-342", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-769", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
busB = bus [label: "BUS-450", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "400 kW"]
mcbB1 = breaker [label: "CB-313", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-764", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
tie = ats [label: "CB-388", rating: "400 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-720", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1pnl = hub [label: "FD-934", rating: "3P+N"]
f1l1ld = load [label: "PNL-1467", rating: "SHORE POWER PANEL / 47 kW"]
f1l2ld = load [label: "PNL-1434", rating: "DOCK LIGHTING / 17 kW"]
f2cb = breaker [label: "CB-387", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-746", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1499", rating: "SHORE POWER PANEL / 46 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
