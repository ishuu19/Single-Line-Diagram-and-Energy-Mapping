sld "GEN-0780 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-407", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1640", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-390", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-742", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
srcA2 = utility [label: "138kV STANDBY", voltage: "138kV"]
laA2 = surge_arrester [label: "LA-1215", voltage: "138kV"]
txA2 = transformer_dy [label: "TX-1620", rating: "38240 kVA", voltage: "138kV / 13.8kV"]
mcbA2 = breaker [label: "CB-323", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-780", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1pr = recloser [label: "CB-338", rating: "160 A"]
f1l1ld = load [label: "PNL-1489", rating: "DISTRIBUTION FEEDER / 1033 kW"]
f2cb = breaker [label: "CB-347", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-705", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1424", rating: "DISTRIBUTION FEEDER / 1024 kW"]
f3cb = breaker [label: "CB-320", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-736", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1432", rating: "STATION SERVICE / 60 kW"]

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
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
