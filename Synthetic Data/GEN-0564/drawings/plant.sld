sld "GEN-0564 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-495", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1666", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-393", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-728", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 593 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-321", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-707", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1cb = breaker [label: "CB-332", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-761", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1441", rating: "ACADEMIC BLOCK PANEL / 77 kW"]
f2cb = breaker [label: "CB-388", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-748", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-320", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-810", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1137", rating: "22 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
