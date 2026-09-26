sld "GEN-0227 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-414", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1295", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1680", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-356", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-781", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
srcA2 = utility [label: "138kV STANDBY", voltage: "138kV"]
txA2 = transformer_yd [label: "TX-1605", rating: "23900 kVA", voltage: "138kV / 13.8kV"]
mcbA2 = breaker [label: "CB-381", rating: "MCCB / 1000 A / 3P"]
mctA2 = ct [label: "TA-720", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1cb = breaker [label: "CB-352", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1pnl = hub [label: "FD-921", rating: "3P+N"]
f1l1ld = load [label: "PNL-1404", rating: "DISTRIBUTION FEEDER / 617 kW"]
f1l2ld = load [label: "PNL-1482", rating: "STATION SERVICE / 94 kW"]
f2cb = breaker [label: "CB-333", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-715", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1462", rating: "DISTRIBUTION FEEDER / 484 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
