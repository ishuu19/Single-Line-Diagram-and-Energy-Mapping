sld "GEN-0887 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-453", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1619", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-397", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-775", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-316", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-880", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1149", rating: "41 kW / PROC"]
f2cb = breaker [label: "CB-338", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-787", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-315", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1197", rating: "15 kW / COND"]
f3cb = breaker [label: "CB-375", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-767", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-388", rating: "MCCB / 125 A / 3P"]
f3l1drv = vfd [label: "DRV-883", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1110", rating: "59 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
