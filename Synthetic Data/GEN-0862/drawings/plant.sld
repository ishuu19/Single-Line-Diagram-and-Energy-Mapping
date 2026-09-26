sld "GEN-0862 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-459", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1605", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-376", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-718", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1pnl = hub [label: "FD-915", rating: "3P+N"]
f1l1ld = load [label: "PNL-1423", rating: "AUXILIARY PANEL / 87 kW"]
f1l2cb = breaker [label: "CB-315", rating: "MCCB / 250 A / 3P"]
f1l2m = motor [label: "MTR-1101", rating: "105 kW / BLOW"]
f2cb = breaker [label: "CB-329", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-741", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f2pnl = hub [label: "FD-984", rating: "3P+N"]
f2l1cb = breaker [label: "CB-343", rating: "MCCB / 200 A / 3P"]
f2l1m = motor [label: "MTR-1198", rating: "85 kW / BLOW"]
f2l2ld = load [label: "PNL-1471", rating: "AUXILIARY PANEL / 232 kW"]
f3cb = breaker [label: "CB-335", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-730", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-324", rating: "MCCB / 250 A / 3P"]
f3l1m = motor [label: "MTR-1149", rating: "100 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
