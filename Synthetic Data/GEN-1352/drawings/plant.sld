sld "GEN-1352 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-422", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1643", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-389", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-752", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1cb = breaker [label: "CB-316", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-716", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1pnl = hub [label: "FD-980", rating: "3P+N"]
f1l1cb = breaker [label: "CB-378", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-818", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1133", rating: "32 kW / AHU"]
f1l2ld = load [label: "PNL-1411", rating: "WARD LIGHTING / 20 kW"]
f2cb = breaker [label: "CB-374", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-735", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1413", rating: "CRITICAL BRANCH / 67 kW"]
f3cb = breaker [label: "CB-358", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-740", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f3pnl = hub [label: "FD-902", rating: "3P+N"]
f3l1ld = load [label: "PNL-1441", rating: "LIFE SAFETY BRANCH / 36 kW"]
f3l2ld = load [label: "PNL-1481", rating: "CRITICAL BRANCH / 49 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
