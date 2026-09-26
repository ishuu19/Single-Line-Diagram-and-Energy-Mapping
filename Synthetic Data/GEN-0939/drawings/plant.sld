sld "GEN-0939 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-404", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1296", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1652", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-366", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1cb = breaker [label: "CB-349", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-741", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1pr = recloser [label: "CB-378", rating: "100 A"]
f1l1ld = load [label: "PNL-1400", rating: "STATION SERVICE / 77 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pr
f1pr -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
