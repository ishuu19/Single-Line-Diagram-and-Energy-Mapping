sld "GEN-0055 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-491", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-341", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-772", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1cb = breaker [label: "CB-305", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-764", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-326", rating: "MCCB / 200 A / 3P"]
f1l1drv = vfd [label: "DRV-891", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1185", rating: "86 kW / COMP"]
f2cb = breaker [label: "CB-328", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-754", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-387", rating: "MCCB / 80 A / 3P"]
f2l1m = motor [label: "MTR-1168", rating: "35 kW / COND"]
f3cb = breaker [label: "CB-388", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-748", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f3pnl = hub [label: "FD-984", rating: "3P+N"]
f3l1cb = breaker [label: "CB-331", rating: "MCCB / 25 A / 3P"]
f3l1m = motor [label: "MTR-1195", rating: "12 kW / EF"]
f3l2cb = breaker [label: "CB-368", rating: "MCCB / 100 A / 3P"]
f3l2drv = vfd [label: "DRV-804", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1161", rating: "45 kW / COMP"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2cb
f3l2cb -> f3l2drv
f3l2drv -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
