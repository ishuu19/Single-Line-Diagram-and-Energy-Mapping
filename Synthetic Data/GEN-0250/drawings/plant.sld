sld "GEN-0250 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-443", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1647", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-737", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
srcA2 = utility [label: "12.47kV STANDBY", voltage: "12.47kV"]
txA2 = transformer_dy [label: "TX-1629", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA2 = breaker [label: "CB-312", rating: "ACB / 250 A / 3P"]
mctA2 = ct [label: "TA-796", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1cb = breaker [label: "CB-393", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1461", rating: "TENANT PANEL / 83 kW"]
f2cb = breaker [label: "CB-304", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-751", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1438", rating: "TENANT PANEL / 66 kW"]
f3cb = breaker [label: "CB-325", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-778", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1428", rating: "FLOOR LIGHTING / 73 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
