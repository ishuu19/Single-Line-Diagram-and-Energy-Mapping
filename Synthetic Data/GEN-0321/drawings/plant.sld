sld "GEN-0321 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-427", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1634", rating: "23900 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-345", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-756", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1cb = breaker [label: "CB-307", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-735", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1415", rating: "STATION SERVICE / 142 kW"]
f2cb = breaker [label: "CB-354", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-764", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f2pnl = hub [label: "FD-923", rating: "3P+N"]
f2l1ld = load [label: "PNL-1451", rating: "STATION SERVICE / 111 kW"]
f2l2ld = load [label: "PNL-1428", rating: "STATION SERVICE / 130 kW"]
f3cb = breaker [label: "CB-379", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-787", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1480", rating: "DISTRIBUTION FEEDER / 485 kW"]

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
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
