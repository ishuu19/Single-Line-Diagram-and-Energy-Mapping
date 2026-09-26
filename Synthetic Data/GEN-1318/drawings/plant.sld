sld "GEN-1318 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-410", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1280", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1616", rating: "38240 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-387", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-723", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
srcA2 = utility [label: "138kV STANDBY", voltage: "138kV"]
laA2 = surge_arrester [label: "LA-1211", voltage: "138kV"]
txA2 = transformer_dy [label: "TX-1679", rating: "38240 kVA", voltage: "138kV / 13.8kV"]
mcbA2 = breaker [label: "CB-354", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-792", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1cb = breaker [label: "CB-312", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1pr = recloser [label: "CB-381", rating: "160 A"]
f1l1ld = load [label: "PNL-1440", rating: "STATION SERVICE / 147 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> laA2
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pr
f1pr -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
