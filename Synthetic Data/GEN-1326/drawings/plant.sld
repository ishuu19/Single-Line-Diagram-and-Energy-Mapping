sld "GEN-1326 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-469", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1611", rating: "15060 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-346", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-734", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1430", rating: "STATION SERVICE / 79 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
