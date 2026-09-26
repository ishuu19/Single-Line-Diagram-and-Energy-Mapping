sld "GEN-0267 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-444", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1621", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-399", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-787", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
srcA2 = utility [label: "12.47kV STANDBY", voltage: "12.47kV"]
txA2 = transformer_yd [label: "TX-1661", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA2 = breaker [label: "CB-385", rating: "ACB / 250 A / 3P"]
mctA2 = ct [label: "TA-702", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1446", rating: "COMMON AREA LIGHTING / 38 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
