sld "GEN-0257 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-417", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1648", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-363", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-728", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1cb = breaker [label: "CB-303", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-792", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-311", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-865", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1146", rating: "27 kW / AHU"]
f2cb = breaker [label: "CB-339", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-709", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1402", rating: "ACADEMIC BLOCK PANEL / 47 kW"]
f3cb = breaker [label: "CB-335", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-758", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1487", rating: "ACADEMIC BLOCK PANEL / 87 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
