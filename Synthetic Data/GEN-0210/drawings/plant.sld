sld "GEN-0210 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-438", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-344", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-734", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1cb = breaker [label: "CB-305", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-727", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-368", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-887", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1106", rating: "27 kW / RWP"]
f2cb = breaker [label: "CB-345", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-743", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1465", rating: "DOSING PANEL / 21 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
