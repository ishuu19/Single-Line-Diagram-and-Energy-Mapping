sld "GEN-0163 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-403", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1602", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-369", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-717", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1cb = breaker [label: "CB-352", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-794", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1439", rating: "RISER PANEL / 91 kW"]
f2cb = breaker [label: "CB-398", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-766", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1449", rating: "COMMON AREA LIGHTING / 54 kW"]
f3cb = breaker [label: "CB-302", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-745", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1476", rating: "COMMON AREA LIGHTING / 53 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
