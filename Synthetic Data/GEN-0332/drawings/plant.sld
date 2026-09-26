sld "GEN-0332 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-485", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1658", rating: "19120 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-354", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-744", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-722", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1409", rating: "STATION SERVICE / 70 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
