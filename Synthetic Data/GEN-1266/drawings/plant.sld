sld "GEN-1266 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-462", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1646", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-387", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-758", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1cb = breaker [label: "CB-393", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-770", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-312", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1108", rating: "11 kW / EF"]
f2cb = breaker [label: "CB-347", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-729", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-351", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-820", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1172", rating: "30 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
