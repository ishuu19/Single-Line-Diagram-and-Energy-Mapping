sld "GEN-1231 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-420", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1612", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1cb = breaker [label: "CB-360", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1pnl = hub [label: "FD-915", rating: "3P+N"]
f1l1ld = load [label: "PNL-1471", rating: "TENANT PANEL / 92 kW"]
f1l2cb = breaker [label: "CB-317", rating: "MCCB / 100 A / 3P"]
f1l2m = motor [label: "MTR-1169", rating: "21 kW / EF"]
f2cb = breaker [label: "CB-355", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-732", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1444", rating: "FLOOR LIGHTING / 47 kW"]
f3cb = breaker [label: "CB-390", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-710", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f3pnl = hub [label: "FD-924", rating: "3P+N"]
f3l1ld = load [label: "PNL-1497", rating: "TENANT PANEL / 63 kW"]
f3l2cb = breaker [label: "CB-372", rating: "MCCB / 80 A / 3P"]
f3l2m = motor [label: "MTR-1162", rating: "20 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
