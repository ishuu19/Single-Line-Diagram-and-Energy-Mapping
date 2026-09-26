sld "GEN-0613 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-410", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1613", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-310", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-797", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
srcA2 = utility [label: "6.6kV STANDBY", voltage: "6.6kV"]
txA2 = transformer_yd [label: "TX-1653", rating: "690 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-373", rating: "ACB / 1000 A / 3P"]
mctA2 = ct [label: "TA-701", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
srcA3 = solar [label: "PV ARRAY 370 kW", voltage: "400Y/230V"]
mcbA3 = breaker [label: "CB-388", rating: "MCCB / 160 A / 3P"]
mctA3 = ct [label: "TA-721", rating: "3 CTs / 160/5 A"]
mpmA3 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-316", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-796", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-352", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-834", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1113", rating: "23 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
srcA3 -> mcbA3
mcbA3 -> mctA3
mctA3 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
mctA3 -> mpmA3
f1ct -> f1pm
