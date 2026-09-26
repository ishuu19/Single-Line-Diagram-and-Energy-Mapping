sld "GEN-1242 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-410", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1612", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-399", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-777", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1cb = breaker [label: "CB-318", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1483", rating: "SHOP LIGHTING / 17 kW"]
f2cb = breaker [label: "CB-310", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-752", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-334", rating: "MCCB / 100 A / 3P"]
f2l1m = motor [label: "MTR-1117", rating: "24 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
