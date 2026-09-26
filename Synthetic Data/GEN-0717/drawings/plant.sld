sld "GEN-0717 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-416", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1674", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-313", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-708", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1cb = breaker [label: "CB-369", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-724", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1490", rating: "DOCK PANEL / 31 kW"]
f2cb = breaker [label: "CB-380", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-745", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-389", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-829", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1194", rating: "55 kW / COMP"]
f3cb = breaker [label: "CB-304", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-747", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f3pnl = hub [label: "FD-938", rating: "3P+N"]
f3l1cb = breaker [label: "CB-355", rating: "MCCB / 50 A / 3P"]
f3l1m = motor [label: "MTR-1137", rating: "22 kW / COND"]
f3l2cb = breaker [label: "CB-359", rating: "MCCB / 20 A / 3P"]
f3l2m = motor [label: "MTR-1128", rating: "9 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2cb
f3l2cb -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
