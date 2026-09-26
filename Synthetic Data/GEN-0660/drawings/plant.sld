sld "GEN-0660 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-446", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1610", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-388", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-724", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1cb = breaker [label: "CB-395", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-712", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f1pnl = hub [label: "FD-932", rating: "3P+N"]
f1l1ld = load [label: "PNL-1472", rating: "DOCK PANEL / 21 kW"]
f1l2cb = breaker [label: "CB-373", rating: "MCCB / 50 A / 3P"]
f1l2m = motor [label: "MTR-1181", rating: "20 kW / COND"]
f2cb = breaker [label: "CB-323", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-770", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1484", rating: "DOCK PANEL / 20 kW"]
f3cb = breaker [label: "CB-339", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-762", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-375", rating: "MCCB / 160 A / 3P"]
f3l1drv = vfd [label: "DRV-812", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1146", rating: "71 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
