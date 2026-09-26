sld "GEN-0034 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-439", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1653", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-365", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-731", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
srcA2 = utility [label: "22kV STANDBY", voltage: "22kV"]
txA2 = transformer_yd [label: "TX-1688", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-368", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-784", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-717", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1458", rating: "DOSING PANEL / 18 kW"]
f2cb = breaker [label: "CB-335", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-778", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1490", rating: "DOSING PANEL / 27 kW"]
f3cb = breaker [label: "CB-320", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-780", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1405", rating: "DOSING PANEL / 17 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
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
