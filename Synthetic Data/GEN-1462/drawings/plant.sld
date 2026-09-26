sld "GEN-1462 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-497", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1277", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1608", rating: "5980 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-375", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-780", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
srcA2 = utility [label: "138kV STANDBY", voltage: "138kV"]
txA2 = transformer_dy [label: "TX-1644", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA2 = breaker [label: "CB-333", rating: "ACB / 2000 A / 3P"]
mctA2 = ct [label: "TA-786", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-792", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1pr = sectionalizer [label: "CB-308", rating: "100 A"]
f1l1ld = load [label: "PNL-1407", rating: "STATION SERVICE / 93 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pr
f1pr -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
