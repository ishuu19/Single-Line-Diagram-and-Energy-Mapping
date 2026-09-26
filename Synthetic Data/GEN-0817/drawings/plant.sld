sld "GEN-0817 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-499", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1605", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-374", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-767", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1cb = breaker [label: "CB-326", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-712", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1pnl = hub [label: "FD-946", rating: "3P+N"]
f1l1ld = load [label: "PNL-1463", rating: "UTILITY PANEL / 30 kW"]
f1l2cb = breaker [label: "CB-397", rating: "MCCB / 50 A / 3P"]
f1l2m = motor [label: "MTR-1118", rating: "22 kW / COMP"]
f2cb = breaker [label: "CB-314", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-780", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-347", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-884", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1124", rating: "37 kW / PROC"]
f3cb = breaker [label: "CB-334", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-747", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-346", rating: "MCCB / 63 A / 3P"]
f3l1drv = vfd [label: "DRV-833", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1120", rating: "31 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
