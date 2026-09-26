sld "GEN-1385 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-454", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1616", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-368", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-731", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
busB = bus [label: "BUS-421", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
mcbB1 = breaker [label: "CB-336", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-723", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
tie = bus_tie [label: "CB-300", rating: "400 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-316", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-779", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-338", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-804", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1167", rating: "24 kW / BLOW"]
f2cb = breaker [label: "CB-303", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1494", rating: "DOSING PANEL / 20 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busB -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
