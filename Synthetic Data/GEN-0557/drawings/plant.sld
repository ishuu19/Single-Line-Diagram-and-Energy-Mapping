sld "GEN-0557 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-467", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-398", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-720", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1cb = breaker [label: "CB-312", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1pnl = hub [label: "FD-931", rating: "3P+N"]
f1l1cb = breaker [label: "CB-396", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1174", rating: "31 kW / COMP"]
f1l2ld = load [label: "PNL-1482", rating: "UTILITY PANEL / 16 kW"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-759", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-393", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1131", rating: "13 kW / EF"]
f3cb = breaker [label: "CB-387", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-757", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-332", rating: "MCCB / 100 A / 3P"]
f3l1drv = vfd [label: "DRV-840", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1160", rating: "48 kW / PROC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
