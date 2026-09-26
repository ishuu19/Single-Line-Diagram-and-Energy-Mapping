sld "GEN-1340 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-427", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1609", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-340", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-702", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1cb = breaker [label: "CB-335", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-758", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-356", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1186", rating: "9 kW / EF"]
f2cb = breaker [label: "CB-334", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-730", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f2pnl = hub [label: "FD-974", rating: "3P+N"]
f2l1cb = breaker [label: "CB-398", rating: "MCCB / 25 A / 3P"]
f2l1m = motor [label: "MTR-1164", rating: "11 kW / EF"]
f2l2cb = breaker [label: "CB-330", rating: "MCCB / 40 A / 3P"]
f2l2drv = vfd [label: "DRV-814", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1146", rating: "16 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
