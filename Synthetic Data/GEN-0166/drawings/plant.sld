sld "GEN-0166 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-407", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1255", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1627", rating: "38240 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-363", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-779", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1cb = breaker [label: "CB-360", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-706", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1406", rating: "STATION SERVICE / 150 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
