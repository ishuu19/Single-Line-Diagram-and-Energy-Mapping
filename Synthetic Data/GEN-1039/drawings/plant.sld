sld "GEN-1039 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-435", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-371", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-754", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1pnl = hub [label: "FD-928", rating: "3P+N"]
f1l1ld = load [label: "PNL-1490", rating: "WARD LIGHTING / 39 kW"]
f1l2ld = load [label: "PNL-1450", rating: "LIFE SAFETY BRANCH / 36 kW"]
f2cb = breaker [label: "CB-369", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-761", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f2pnl = hub [label: "FD-927", rating: "3P+N"]
f2l1ld = load [label: "PNL-1434", rating: "LIFE SAFETY BRANCH / 36 kW"]
f2l2cb = breaker [label: "CB-301", rating: "MCCB / 80 A / 3P"]
f2l2drv = vfd [label: "DRV-838", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1106", rating: "33 kW / AHU"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
