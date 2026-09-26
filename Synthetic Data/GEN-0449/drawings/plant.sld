sld "GEN-0449 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-470", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1617", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-362", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-746", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 179 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-395", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-772", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1cb = breaker [label: "CB-398", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1477", rating: "ACADEMIC BLOCK PANEL / 70 kW"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-774", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-344", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-815", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1130", rating: "29 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
