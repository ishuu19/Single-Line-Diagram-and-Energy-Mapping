sld "GEN-0328 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-461", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1631", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-377", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-764", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-716", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-330", rating: "MCCB / 160 A / 3P"]
f1l1m = motor [label: "MTR-1127", rating: "39 kW / COMP"]
f2cb = breaker [label: "CB-371", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1485", rating: "PACKAGING PANEL / 13 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
