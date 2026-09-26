sld "GEN-0066 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-430", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1259", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1604", rating: "23900 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-342", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-772", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1cb = breaker [label: "CB-363", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1pnl = hub [label: "FD-940", rating: "3P+N"]
f1l1ld = load [label: "PNL-1498", rating: "DISTRIBUTION FEEDER / 849 kW"]
f1l2ld = load [label: "PNL-1434", rating: "DISTRIBUTION FEEDER / 711 kW"]
f2cb = breaker [label: "CB-317", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-747", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1485", rating: "STATION SERVICE / 70 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
