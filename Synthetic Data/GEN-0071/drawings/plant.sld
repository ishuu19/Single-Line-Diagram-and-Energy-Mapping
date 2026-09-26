sld "GEN-0071 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-404", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1625", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-387", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-783", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-764", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-336", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-874", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1136", rating: "25 kW / CRAC"]
f2cb = breaker [label: "CB-371", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-715", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f2pnl = hub [label: "FD-958", rating: "3P+N"]
f2l1cb = breaker [label: "CB-305", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-816", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1126", rating: "24 kW / CRAC"]
f2l2cb = breaker [label: "CB-374", rating: "MCCB / 50 A / 3P"]
f2l2drv = vfd [label: "DRV-888", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1109", rating: "22 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
