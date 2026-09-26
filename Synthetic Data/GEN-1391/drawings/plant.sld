sld "GEN-1391 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-479", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-792", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1451", rating: "WARD LIGHTING / 35 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-719", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f2pnl = hub [label: "FD-980", rating: "3P+N"]
f2l1cb = breaker [label: "CB-395", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-889", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1138", rating: "19 kW / AHU"]
f2l2ld = load [label: "PNL-1454", rating: "LIFE SAFETY BRANCH / 41 kW"]
f3cb = breaker [label: "CB-332", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-710", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1432", rating: "LIFE SAFETY BRANCH / 40 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
