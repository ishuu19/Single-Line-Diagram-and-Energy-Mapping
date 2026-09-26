sld "GEN-0819 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-413", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1670", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-302", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-703", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
srcA2 = utility [label: "22kV STANDBY", voltage: "22kV"]
txA2 = transformer_yd [label: "TX-1694", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-313", rating: "ACB / 1000 A / 3P"]
mctA2 = ct [label: "TA-709", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1cb = breaker [label: "CB-388", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1489", rating: "DOSING PANEL / 38 kW"]
f2cb = breaker [label: "CB-329", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-737", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1416", rating: "DOSING PANEL / 18 kW"]
f3cb = breaker [label: "CB-345", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-708", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-347", rating: "MCCB / 80 A / 3P"]
f3l1drv = vfd [label: "DRV-838", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1113", rating: "35 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
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
