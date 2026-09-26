sld "GEN-0253 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-454", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1611", rating: "1730 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-302", rating: "ACB / 2500 A / 3P"]
mctA1 = ct [label: "TA-740", rating: "3 CTs / 2500/5 A"]
mpmA1 = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-756", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1pnl = hub [label: "FD-942", rating: "3P+N"]
f1l1cb = breaker [label: "CB-359", rating: "MCCB / 630 A / 3P"]
f1l1drv = vfd [label: "DRV-886", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1104", rating: "284 kW / MILL"]
f1l2ld = load [label: "PNL-1442", rating: "MCC AUXILIARY BOARD / 49 kW"]
f1x = capacitor_bank [label: "CAP-603", rating: "122 kVAR"]
f2cb = breaker [label: "CB-344", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-388", rating: "MCCB / 200 A / 3P"]
f2l1m = motor [label: "MTR-1114", rating: "85 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
f1pnl -> f1x
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
