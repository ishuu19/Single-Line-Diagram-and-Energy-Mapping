sld "GEN-1233 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-457", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1643", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-336", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-724", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 174 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-379", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-730", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1cb = breaker [label: "CB-310", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-737", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-337", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-842", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1108", rating: "16 kW / AHU"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-704", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1401", rating: "SITE LIGHTING / 34 kW"]
f3cb = breaker [label: "CB-328", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-755", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1448", rating: "SITE LIGHTING / 35 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
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
