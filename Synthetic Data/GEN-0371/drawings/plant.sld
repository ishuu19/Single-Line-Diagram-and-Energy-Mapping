sld "GEN-0371 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-456", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1691", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-361", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-772", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-710", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f1pnl = hub [label: "FD-977", rating: "3P+N"]
f1l1cb = breaker [label: "CB-314", rating: "MCCB / 1000 A / 3P"]
f1l1drv = vfd [label: "DRV-880", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1156", rating: "397 kW / MILL"]
f1l2cb = breaker [label: "CB-350", rating: "MCCB / 1000 A / 3P"]
f1l2drv = vfd [label: "DRV-809", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1181", rating: "307 kW / MILL"]
f2cb = breaker [label: "CB-363", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-799", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-399", rating: "MCCB / 400 A / 3P"]
f2l1m = motor [label: "MTR-1140", rating: "85 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
