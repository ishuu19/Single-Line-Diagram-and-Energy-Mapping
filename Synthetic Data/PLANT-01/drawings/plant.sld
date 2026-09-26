sld "PLANT-01 — PLANT ELECTRICAL DISTRIBUTION"
# CONSOLIDATED SINGLE-LINE DIAGRAM / POWER, PROTECTION AND METERING
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-499", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8 kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1667", rating: "1500 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-728", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
busB = bus [label: "BUS-401", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8 kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_dy [label: "TX-1600", rating: "1500 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-346", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-744", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
tie = bus_tie [label: "CB-378", rating: "2000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-333", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-799", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1pnl = hub [label: "FD-957", rating: "3P+N"]
f1l1cb = breaker [label: "CB-379", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-806", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1191", rating: "22 kW / CHWP"]
f1l2cb = breaker [label: "CB-351", rating: "MCCB / 40 A / 3P"]
f1l2drv = vfd [label: "DRV-800", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1138", rating: "22 kW / CHWP"]
f1l3cb = breaker [label: "CB-306", rating: "MCCB / 40 A / 3P"]
f1l3drv = vfd [label: "DRV-886", rating: "VFD / OL"]
f1l3m = motor [label: "MTR-1174", rating: "22 kW / CHWP"]
f1l4cb = breaker [label: "CB-332", rating: "MCCB / 40 A / 3P"]
f1l4drv = vfd [label: "DRV-808", rating: "VFD / OL"]
f1l4m = motor [label: "MTR-1132", rating: "22 kW / CHWP"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-734", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1481", rating: "PACKAGED CHILLER / 220 kW"]
f3cb = breaker [label: "CB-385", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-776", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1427", rating: "PACKAGED CHILLER / 220 kW"]
f4cb = breaker [label: "CB-386", rating: "MCCB / 160 A / 3P"]
f4ct = ct [label: "TA-751", rating: "3 CTs / 160/5 A"]
f4pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f4pnl = hub [label: "FD-925", rating: "3P+N"]
f4l1cb = breaker [label: "CB-313", rating: "MCCB / 63 A / 3P"]
f4l1drv = vfd [label: "DRV-897", rating: "VFD / OL"]
f4l1m = motor [label: "MTR-1194", rating: "30 kW / CWP"]
f4l2cb = breaker [label: "CB-394", rating: "MCCB / 63 A / 3P"]
f4l2drv = vfd [label: "DRV-805", rating: "VFD / OL"]
f4l2m = motor [label: "MTR-1119", rating: "30 kW / CWP"]
f5cb = breaker [label: "CB-393", rating: "MCCB / 100 A / 3P"]
f5ct = ct [label: "TA-727", rating: "3 CTs / 100/5 A"]
f5pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f5pnl = hub [label: "FD-986", rating: "3P+N"]
f5l1cb = breaker [label: "CB-364", rating: "MCCB / 32 A / 3P"]
f5l1drv = vfd [label: "DRV-879", rating: "VFD / OL"]
f5l1m = motor [label: "MTR-1128", rating: "15 kW / AHU"]
f5l2cb = breaker [label: "CB-336", rating: "MCCB / 32 A / 3P"]
f5l2drv = vfd [label: "DRV-813", rating: "VFD / OL"]
f5l2m = motor [label: "MTR-1196", rating: "15 kW / AHU"]
f5l3ld = load [label: "PNL-1443", rating: "AUXILIARIES / 12 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4/0 AWG"]
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
f1pnl -> f1l4cb
f1l4cb -> f1l4drv
f1l4drv -> f1l4m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
busB -> f4cb [cable: "3#1/0 AWG"]
f4cb -> f4ct
f4ct -> f4pnl
f4pnl -> f4l1cb
f4l1cb -> f4l1drv
f4l1drv -> f4l1m
f4pnl -> f4l2cb
f4l2cb -> f4l2drv
f4l2drv -> f4l2m
busB -> f5cb [cable: "3#4 AWG"]
f5cb -> f5ct
f5ct -> f5pnl
f5pnl -> f5l1cb
f5l1cb -> f5l1drv
f5l1drv -> f5l1m
f5pnl -> f5l2cb
f5l2cb -> f5l2drv
f5l2drv -> f5l2m
f5pnl -> f5l3ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
f4ct -> f4pm
f5ct -> f5pm
