sld "GEN-0677 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-407", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1638", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-382", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-777", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
srcA2 = utility [label: "12.47kV STANDBY", voltage: "12.47kV"]
txA2 = transformer_yd [label: "TX-1614", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA2 = breaker [label: "CB-352", rating: "MCCB / 1000 A / 3P"]
mctA2 = ct [label: "TA-781", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
srcA3 = solar [label: "PV ARRAY 369 kW", voltage: "208Y/120V"]
mcbA3 = breaker [label: "CB-323", rating: "MCCB / 160 A / 3P"]
mctA3 = ct [label: "TA-791", rating: "3 CTs / 160/5 A"]
mpmA3 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-723", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1pnl = hub [label: "FD-940", rating: "3P+N"]
f1l1ld = load [label: "PNL-1435", rating: "AUXILIARY PANEL / 8 kW"]
f1l2ld = load [label: "PNL-1454", rating: "AUXILIARY PANEL / 33 kW"]
f2cb = breaker [label: "CB-347", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-774", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1431", rating: "AUXILIARY PANEL / 24 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
srcA3 -> mcbA3
mcbA3 -> mctA3
mctA3 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
mctA3 -> mpmA3
f1ct -> f1pm
f2ct -> f2pm
