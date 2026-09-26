sld "GEN-0081 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-479", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1691", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-303", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-750", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-714", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1452", rating: "HOUSE PANEL / 51 kW"]
f2cb = breaker [label: "CB-349", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-762", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1418", rating: "SALES FLOOR LIGHTING / 33 kW"]
f3cb = breaker [label: "CB-370", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-737", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f3pnl = hub [label: "FD-924", rating: "3P+N"]
f3l1cb = breaker [label: "CB-344", rating: "MCCB / 25 A / 3P"]
f3l1drv = vfd [label: "DRV-885", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1122", rating: "13 kW / AHU"]
f3l2ld = load [label: "PNL-1429", rating: "SALES FLOOR LIGHTING / 31 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
