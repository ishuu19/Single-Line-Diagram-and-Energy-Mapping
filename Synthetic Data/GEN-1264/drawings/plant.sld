sld "GEN-1264 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-405", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
mcbA1 = breaker [label: "CB-300", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1cb = breaker [label: "CB-366", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-748", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1pr = recloser [label: "CB-364", rating: "160 A"]
f1l1ld = load [label: "PNL-1469", rating: "DISTRIBUTION FEEDER / 474 kW"]
f2cb = breaker [label: "CB-398", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-744", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f2pr = sectionalizer [label: "CB-346", rating: "400 A"]
f2l1ld = load [label: "PNL-1481", rating: "STATION SERVICE / 62 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pr
f1pr -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pr
f2pr -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
