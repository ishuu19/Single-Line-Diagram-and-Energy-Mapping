sld "GEN-0054 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-455", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1648", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-374", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-782", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
srcA2 = utility [label: "33kV STANDBY", voltage: "33kV"]
mcbA2 = breaker [label: "CB-348", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-714", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1cb = breaker [label: "CB-367", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-377", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-874", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1130", rating: "26 kW / BLOW"]
f2cb = breaker [label: "CB-322", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-749", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1451", rating: "DOSING PANEL / 36 kW"]
f3cb = breaker [label: "CB-319", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-752", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1433", rating: "DOSING PANEL / 39 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
