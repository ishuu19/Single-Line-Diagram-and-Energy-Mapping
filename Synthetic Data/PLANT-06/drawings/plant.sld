sld "PLANT-06 — HOSPITAL ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL BRANCH SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-469", voltage: "400Y/230V"]
srcA1 = utility [label: "11 kV UTILITY", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1633", rating: "1250 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-339", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-779", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
busB = bus [label: "BUS-465", voltage: "400Y/230V"]
srcB1 = generator [label: "ESSENTIAL GENERATOR", voltage: "400Y/230V", rating: "800 kW"]
mcbB1 = breaker [label: "CB-367", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-734", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
tie = ats [label: "CB-372", rating: "1600 A / 3P / ESSENTIAL BRANCH TRANSFER"]
f1cb = breaker [label: "CB-378", rating: "MCCB / 630 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 600/5 A"]
f1pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1pnl = hub [label: "FD-975", rating: "3P+N"]
f1l1cb = breaker [label: "CB-371", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-842", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1165", rating: "45 kW / AHU"]
f1l2cb = breaker [label: "CB-393", rating: "MCCB / 100 A / 3P"]
f1l2drv = vfd [label: "DRV-823", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1199", rating: "45 kW / AHU"]
f1l3cb = breaker [label: "CB-331", rating: "MCCB / 100 A / 3P"]
f1l3drv = vfd [label: "DRV-878", rating: "VFD / OL"]
f1l3m = motor [label: "MTR-1157", rating: "45 kW / AHU"]
f1l4ld = load [label: "PNL-1489", rating: "WARD PANEL / 55 kW"]
f2cb = breaker [label: "CB-325", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f2pnl = hub [label: "FD-954", rating: "3P+N"]
f2l1ld = load [label: "PNL-1430", rating: "CHILLER UNIT / 120 kW"]
f2l2cb = breaker [label: "CB-399", rating: "MCCB / 50 A / 3P"]
f2l2drv = vfd [label: "DRV-862", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1105", rating: "22 kW / CHWP"]
f2l3cb = breaker [label: "CB-397", rating: "MCCB / 50 A / 3P"]
f2l3drv = vfd [label: "DRV-884", rating: "VFD / OL"]
f2l3m = motor [label: "MTR-1115", rating: "22 kW / CHWP"]
f3cb = breaker [label: "CB-382", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-726", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1478", rating: "LIFE SAFETY BRANCH / 85 kW"]
f4cb = breaker [label: "CB-368", rating: "MCCB / 250 A / 3P"]
f4ct = ct [label: "TA-760", rating: "3 CTs / 250/5 A"]
f4pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f4l1ld = load [label: "PNL-1465", rating: "CRITICAL BRANCH / THEATRES / 110 kW"]
f5cb = breaker [label: "CB-363", rating: "MCCB / 160 A / 3P"]
f5ct = ct [label: "TA-704", rating: "3 CTs / 160/5 A"]
f5pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f5pnl = hub [label: "FD-946", rating: "3P+N"]
f5l1ld = load [label: "PNL-1488", rating: "IMAGING / 48 kW"]
f5l2cb = breaker [label: "CB-387", rating: "MCCB / 32 A / 3P"]
f5l2m = motor [label: "MTR-1132", rating: "15 kW / EF"]
f5l3cb = breaker [label: "CB-354", rating: "MCCB / 32 A / 3P"]
f5l3m = motor [label: "MTR-1184", rating: "15 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#350 MCM"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
f1pnl -> f1l3cb
f1l3cb -> f1l3drv
f1l3drv -> f1l3m
f1pnl -> f1l4ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
f2pnl -> f2l3cb
f2l3cb -> f2l3drv
f2l3drv -> f2l3m
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
busB -> f4cb [cable: "3#2/0 AWG"]
f4cb -> f4ct
f4ct -> f4l1ld
busB -> f5cb [cable: "3#1/0 AWG"]
f5cb -> f5ct
f5ct -> f5pnl
f5pnl -> f5l1ld
f5pnl -> f5l2cb
f5l2cb -> f5l2m
f5pnl -> f5l3cb
f5l3cb -> f5l3m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
f4ct -> f4pm
f5ct -> f5pm
