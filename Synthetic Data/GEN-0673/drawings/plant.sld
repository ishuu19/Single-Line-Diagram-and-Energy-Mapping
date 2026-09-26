sld "GEN-0673 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-414", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1287", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1699", rating: "9560 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-387", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-721", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-384", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-765", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1418", rating: "DISTRIBUTION FEEDER / 422 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
