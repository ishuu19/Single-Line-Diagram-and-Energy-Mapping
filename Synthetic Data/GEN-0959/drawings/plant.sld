sld "GEN-0959 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-457", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1664", rating: "5980 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-364", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1cb = breaker [label: "CB-391", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-797", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1465", rating: "DISTRIBUTION FEEDER / 825 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
