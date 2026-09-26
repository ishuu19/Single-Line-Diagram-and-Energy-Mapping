sld "GEN-0428 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-435", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1668", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-316", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-714", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
busB = bus [label: "BUS-453", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_dy [label: "TX-1688", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-335", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-776", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
tie = bus_tie [label: "CB-370", rating: "800 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-373", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-758", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f1pnl = hub [label: "FD-990", rating: "3P+N"]
f1l1ld = load [label: "PNL-1481", rating: "DC FAST CHARGER BANK / 152 kW"]
f1l2ld = load [label: "PNL-1420", rating: "DC FAST CHARGER BANK / 134 kW"]
f2cb = breaker [label: "CB-340", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-773", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1485", rating: "CANOPY AUXILIARIES / 15 kW"]

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
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
