sld "GEN-0561 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-435", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-730", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1cb = breaker [label: "CB-384", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-786", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1418", rating: "DISTRIBUTION FEEDER / 859 kW"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-726", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f2pr = recloser [label: "CB-319", rating: "100 A"]
f2l1ld = load [label: "PNL-1414", rating: "STATION SERVICE / 70 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pr
f2pr -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
