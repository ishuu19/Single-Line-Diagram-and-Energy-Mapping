sld "GEN-1017 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-483", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1227", voltage: "138kV"]
mcbA1 = breaker [label: "CB-341", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-744", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
srcA2 = utility [label: "138kV STANDBY", voltage: "138kV"]
laA2 = surge_arrester [label: "LA-1283", voltage: "138kV"]
txA2 = transformer_yd [label: "TX-1695", rating: "19120 kVA", voltage: "138kV / 13.8kV"]
mcbA2 = breaker [label: "CB-310", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-738", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1cb = breaker [label: "CB-386", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1488", rating: "DISTRIBUTION FEEDER / 993 kW"]
f2cb = breaker [label: "CB-309", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-759", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1487", rating: "STATION SERVICE / 147 kW"]

srcA1 -> laA1
srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> laA2
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
