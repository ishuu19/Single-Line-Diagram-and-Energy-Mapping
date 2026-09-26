sld "GEN-1345 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-464", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1639", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-387", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-762", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 340 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-371", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-706", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1cb = breaker [label: "CB-307", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-770", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-317", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-853", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1160", rating: "35 kW / AHU"]
f2cb = breaker [label: "CB-381", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-765", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1446", rating: "SITE LIGHTING / 29 kW"]
f3cb = breaker [label: "CB-349", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-746", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1462", rating: "SITE LIGHTING / 31 kW"]

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
