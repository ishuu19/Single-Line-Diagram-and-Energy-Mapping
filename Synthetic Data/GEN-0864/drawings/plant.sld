sld "GEN-0864 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-485", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1643", rating: "690 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-384", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-765", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1cb = breaker [label: "CB-393", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-711", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1pnl = hub [label: "FD-971", rating: "3P+N"]
f1l1cb = breaker [label: "CB-398", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-802", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1169", rating: "28 kW / CRAC"]
f1l2cb = breaker [label: "CB-352", rating: "MCCB / 32 A / 3P"]
f1l2m = motor [label: "MTR-1173", rating: "15 kW / EF"]
f2cb = breaker [label: "CB-378", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-772", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2pnl = hub [label: "FD-922", rating: "3P+N"]
f2l1ld = load [label: "PNL-1488", rating: "TENANT PANEL / 40 kW"]
f2l2ld = load [label: "PNL-1421", rating: "TENANT PANEL / 61 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
