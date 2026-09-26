sld "GEN-0957 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-412", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1615", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-319", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1cb = breaker [label: "CB-361", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1pnl = hub [label: "FD-983", rating: "3P+N"]
f1l1cb = breaker [label: "CB-398", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-895", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1108", rating: "38 kW / BLOW"]
f1l2cb = breaker [label: "CB-305", rating: "MCCB / 63 A / 3P"]
f1l2drv = vfd [label: "DRV-874", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1195", rating: "27 kW / BLOW"]

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
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
