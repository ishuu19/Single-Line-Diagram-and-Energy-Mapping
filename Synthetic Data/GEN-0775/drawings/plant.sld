sld "GEN-0775 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-483", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1662", rating: "2080 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-391", rating: "MCCB / 3000 A / 3P"]
mctA1 = ct [label: "TA-790", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1cb = breaker [label: "CB-388", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-737", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1459", rating: "MCC AUXILIARY BOARD / 85 kW"]
f2cb = breaker [label: "CB-342", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-791", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f2pnl = hub [label: "FD-925", rating: "3P+N"]
f2l1ld = load [label: "PNL-1418", rating: "MCC AUXILIARY BOARD / 44 kW"]
f2l2cb = breaker [label: "CB-399", rating: "MCCB / 800 A / 3P"]
f2l2drv = vfd [label: "DRV-885", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1164", rating: "321 kW / MILL"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
