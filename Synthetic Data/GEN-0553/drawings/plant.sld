sld "GEN-0553 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-421", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-389", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-714", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1cb = breaker [label: "CB-301", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-756", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1476", rating: "DOSING PANEL / 23 kW"]
f2cb = breaker [label: "CB-392", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-726", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-333", rating: "MCCB / 160 A / 3P"]
f2l1drv = vfd [label: "DRV-891", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1127", rating: "74 kW / RWP"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
