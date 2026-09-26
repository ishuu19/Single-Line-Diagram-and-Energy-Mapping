sld "GEN-0184 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-419", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1661", rating: "9560 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-300", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-748", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1cb = breaker [label: "CB-327", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-779", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1488", rating: "DISTRIBUTION FEEDER / 925 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
