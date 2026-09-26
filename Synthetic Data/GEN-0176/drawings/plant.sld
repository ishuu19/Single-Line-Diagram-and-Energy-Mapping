sld "GEN-0176 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-441", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1681", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-316", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-795", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1pnl = hub [label: "FD-919", rating: "3P+N"]
f1l1cb = breaker [label: "CB-395", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1135", rating: "13 kW / EF"]
f1l2ld = load [label: "PNL-1403", rating: "FLOOR LIGHTING / 85 kW"]
f2cb = breaker [label: "CB-352", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-709", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1439", rating: "FLOOR LIGHTING / 87 kW"]
f3cb = breaker [label: "CB-367", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-736", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f3pnl = hub [label: "FD-949", rating: "3P+N"]
f3l1cb = breaker [label: "CB-351", rating: "MCCB / 50 A / 3P"]
f3l1drv = vfd [label: "DRV-818", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1191", rating: "22 kW / CRAC"]
f3l2ld = load [label: "PNL-1454", rating: "TENANT PANEL / 70 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
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
