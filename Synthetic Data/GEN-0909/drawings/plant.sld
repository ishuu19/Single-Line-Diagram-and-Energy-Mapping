sld "GEN-0909 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-417", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1644", rating: "1080 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-306", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-740", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1cb = breaker [label: "CB-396", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-745", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-304", rating: "MCCB / 1000 A / 3P"]
f1l1drv = vfd [label: "DRV-860", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1155", rating: "425 kW / MILL"]
f2cb = breaker [label: "CB-302", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1436", rating: "MCC AUXILIARY BOARD / 80 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
