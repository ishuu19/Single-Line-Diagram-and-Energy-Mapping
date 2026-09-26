sld "GEN-0149 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-428", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1227", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1655", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-305", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1cb = breaker [label: "CB-358", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-744", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1pnl = hub [label: "FD-909", rating: "3P+N"]
f1l1ld = load [label: "PNL-1468", rating: "STATION SERVICE / 79 kW"]
f1l2ld = load [label: "PNL-1475", rating: "DISTRIBUTION FEEDER / 999 kW"]
f2cb = breaker [label: "CB-301", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-732", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f2pr = sectionalizer [label: "CB-353", rating: "63 A"]
f2l1ld = load [label: "PNL-1402", rating: "DISTRIBUTION FEEDER / 1042 kW"]
f3cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-743", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1463", rating: "STATION SERVICE / 80 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pr
f2pr -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
