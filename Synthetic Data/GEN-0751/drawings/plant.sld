sld "GEN-0751 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-471", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-357", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-304", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-746", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-393", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-826", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1175", rating: "24 kW / AHU"]
f2cb = breaker [label: "CB-392", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-745", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1415", rating: "LIFE SAFETY BRANCH / 26 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
