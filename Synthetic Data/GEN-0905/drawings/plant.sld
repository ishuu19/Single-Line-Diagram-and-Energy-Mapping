sld "GEN-0905 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-494", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1638", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-341", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-715", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-738", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1492", rating: "AUXILIARY PANEL / 40 kW"]
f2cb = breaker [label: "CB-314", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-743", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f2pnl = hub [label: "FD-972", rating: "3P+N"]
f2l1cb = breaker [label: "CB-372", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-813", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1124", rating: "39 kW / RWP"]
f2l2ld = load [label: "PNL-1456", rating: "DOSING PANEL / 20 kW"]
f3cb = breaker [label: "CB-318", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-726", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-313", rating: "MCCB / 160 A / 3P"]
f3l1drv = vfd [label: "DRV-880", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1155", rating: "73 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
