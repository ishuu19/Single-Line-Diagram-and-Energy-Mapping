sld "GEN-0104 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-456", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1267", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1660", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-364", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-797", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1cb = breaker [label: "CB-327", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1pnl = hub [label: "FD-999", rating: "3P+N"]
f1l1ld = load [label: "PNL-1407", rating: "DISTRIBUTION FEEDER / 622 kW"]
f1l2ld = load [label: "PNL-1449", rating: "STATION SERVICE / 113 kW"]
f2cb = breaker [label: "CB-307", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-750", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1454", rating: "STATION SERVICE / 123 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
