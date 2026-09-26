sld "GEN-0011 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-467", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1669", rating: "2080 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-358", rating: "MCCB / 3000 A / 3P"]
mctA1 = ct [label: "TA-787", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1cb = breaker [label: "CB-398", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-788", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1pnl = hub [label: "FD-958", rating: "3P+N"]
f1l1cb = breaker [label: "CB-386", rating: "MCCB / 320 A / 3P"]
f1l1m = motor [label: "MTR-1119", rating: "136 kW / BLOW"]
f1l2cb = breaker [label: "CB-332", rating: "MCCB / 800 A / 3P"]
f1l2drv = vfd [label: "DRV-822", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1134", rating: "319 kW / MILL"]
f2cb = breaker [label: "CB-391", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-754", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-339", rating: "MCCB / 200 A / 3P"]
f2l1m = motor [label: "MTR-1110", rating: "98 kW / BLOW"]
f3cb = breaker [label: "CB-371", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-728", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-322", rating: "MCCB / 320 A / 3P"]
f3l1m = motor [label: "MTR-1170", rating: "142 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
