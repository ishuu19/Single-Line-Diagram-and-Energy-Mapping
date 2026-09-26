sld "GEN-0800 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-431", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1670", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-306", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-767", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-741", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-384", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-861", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1117", rating: "11 kW / CRAC"]
f2cb = breaker [label: "CB-397", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-714", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1453", rating: "RISER PANEL / 57 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
