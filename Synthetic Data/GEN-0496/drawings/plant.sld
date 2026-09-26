sld "GEN-0496 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-485", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-366", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-787", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
srcA2 = utility [label: "11kV STANDBY", voltage: "11kV"]
txA2 = transformer_yd [label: "TX-1677", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-318", rating: "ACB / 250 A / 3P"]
mctA2 = ct [label: "TA-796", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1cb = breaker [label: "CB-322", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-784", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1465", rating: "DOSING PANEL / 15 kW"]
f2cb = breaker [label: "CB-382", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-712", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1458", rating: "DOSING PANEL / 18 kW"]
f3cb = breaker [label: "CB-338", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-726", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-328", rating: "MCCB / 125 A / 3P"]
f3l1drv = vfd [label: "DRV-825", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1183", rating: "62 kW / RWP"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
