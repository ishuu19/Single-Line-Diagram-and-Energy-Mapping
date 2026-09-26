sld "PLANT-10 — COLD STORAGE / ELECTRICAL DISTRIBUTION"
# REFRIGERATION PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-474", voltage: "400Y/230V"]
srcA1 = utility [label: "11 kV SUPPLY", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1680", rating: "1600 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-303", rating: "ACB / 2500 A / 3P"]
mctA1 = ct [label: "TA-740", rating: "3 CTs / 2500/5 A"]
mpmA1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
busB = bus [label: "BUS-478", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY SET", voltage: "400Y/230V", rating: "1000 kW"]
mcbB1 = breaker [label: "CB-381", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-727", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
tie = ats [label: "CB-345", rating: "2000 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-358", rating: "MCCB / 800 A / 3P"]
f1ct = ct [label: "TA-773", rating: "3 CTs / 800/5 A"]
f1pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1pnl = hub [label: "FD-979", rating: "3P+N"]
f1l1cb = breaker [label: "CB-388", rating: "MCCB / 400 A / 3P"]
f1l1drv = vfd [label: "DRV-803", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1196", rating: "160 kW / COMP"]
f1l2cb = breaker [label: "CB-393", rating: "MCCB / 400 A / 3P"]
f1l2drv = vfd [label: "DRV-885", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1107", rating: "160 kW / COMP"]
f1l3cb = breaker [label: "CB-384", rating: "MCCB / 400 A / 3P"]
f1l3drv = vfd [label: "DRV-842", rating: "VFD / OL"]
f1l3m = motor [label: "MTR-1167", rating: "160 kW / COMP"]
f2cb = breaker [label: "CB-328", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-706", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f2pnl = hub [label: "FD-954", rating: "3P+N"]
f2l1cb = breaker [label: "CB-369", rating: "MCCB / 100 A / 3P"]
f2l1drv = vfd [label: "DRV-835", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1160", rating: "45 kW / COND"]
f2l2cb = breaker [label: "CB-313", rating: "MCCB / 100 A / 3P"]
f2l2drv = vfd [label: "DRV-888", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1116", rating: "45 kW / COND"]
f2l3cb = breaker [label: "CB-386", rating: "MCCB / 100 A / 3P"]
f2l3drv = vfd [label: "DRV-823", rating: "VFD / OL"]
f2l3m = motor [label: "MTR-1102", rating: "45 kW / COND"]
f2l4cb = breaker [label: "CB-322", rating: "MCCB / 100 A / 3P"]
f2l4drv = vfd [label: "DRV-860", rating: "VFD / OL"]
f2l4m = motor [label: "MTR-1147", rating: "45 kW / COND"]
f3cb = breaker [label: "CB-337", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-736", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f3pnl = hub [label: "FD-917", rating: "3P+N"]
f3l1cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f3l1m = motor [label: "MTR-1133", rating: "30 kW / EF"]
f3l2cb = breaker [label: "CB-336", rating: "MCCB / 63 A / 3P"]
f3l2m = motor [label: "MTR-1142", rating: "30 kW / EF"]
f3l3cb = breaker [label: "CB-398", rating: "MCCB / 63 A / 3P"]
f3l3m = motor [label: "MTR-1127", rating: "30 kW / EF"]
f3l4ld = load [label: "PNL-1459", rating: "DOCK PANEL / 55 kW"]
f4cb = breaker [label: "CB-301", rating: "MCCB / 400 A / 3P"]
f4ct = ct [label: "TA-763", rating: "3 CTs / 400/5 A"]
f4pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f4l1cb = breaker [label: "CB-339", rating: "MCCB / 400 A / 3P"]
f4l1drv = vfd [label: "DRV-843", rating: "VFD / OL"]
f4l1m = motor [label: "MTR-1125", rating: "160 kW / COMP"]
f5cb = breaker [label: "CB-316", rating: "MCCB / 160 A / 3P"]
f5ct = ct [label: "TA-724", rating: "3 CTs / 160/5 A"]
f5pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f5pnl = hub [label: "FD-909", rating: "3P+N"]
f5l1ld = load [label: "PNL-1456", rating: "STORE LIGHTING / 40 kW"]
f5l2ld = load [label: "PNL-1443", rating: "CONTROL ROOM / 35 kW"]

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
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
f2pnl -> f2l3cb
f2l3cb -> f2l3drv
f2l3drv -> f2l3m
f2pnl -> f2l4cb
f2l4cb -> f2l4drv
f2l4drv -> f2l4m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2cb
f3l2cb -> f3l2m
f3pnl -> f3l3cb
f3l3cb -> f3l3m
f3pnl -> f3l4ld
busB -> f4cb [cable: "3#4/0 AWG"]
f4cb -> f4ct
f4ct -> f4l1cb
f4l1cb -> f4l1drv
f4l1drv -> f4l1m
busB -> f5cb [cable: "3#1/0 AWG"]
f5cb -> f5ct
f5ct -> f5pnl
f5pnl -> f5l1ld
f5pnl -> f5l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
f4ct -> f4pm
f5ct -> f5pm
