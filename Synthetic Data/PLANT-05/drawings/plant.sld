sld "PLANT-05 — MANUFACTURING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE WITH PF CORRECTION
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-486", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8 kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1610", rating: "2000 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-336", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
busB = bus [label: "BUS-481", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8 kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_yd [label: "TX-1685", rating: "2000 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-371", rating: "ACB / 3000 A / 3P"]
mctB1 = ct [label: "TA-755", rating: "3 CTs / 3000/5 A"]
mpmB1 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
tie = bus_tie [label: "CB-373", rating: "3000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-361", rating: "MCCB / 800 A / 3P"]
f1ct = ct [label: "TA-723", rating: "3 CTs / 800/5 A"]
f1pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1pnl = hub [label: "FD-900", rating: "3P+N"]
f1l1cb = breaker [label: "CB-321", rating: "MCCB / 200 A / 3P"]
f1l1drv = vfd [label: "DRV-818", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1189", rating: "110 kW / PROC"]
f1l2cb = breaker [label: "CB-307", rating: "MCCB / 200 A / 3P"]
f1l2drv = vfd [label: "DRV-874", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1128", rating: "110 kW / PROC"]
f1l3cb = breaker [label: "CB-392", rating: "MCCB / 200 A / 3P"]
f1l3drv = vfd [label: "DRV-831", rating: "VFD / OL"]
f1l3m = motor [label: "MTR-1190", rating: "110 kW / PROC"]
f2cb = breaker [label: "CB-385", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-725", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f2pnl = hub [label: "FD-998", rating: "3P+N"]
f2l1cb = breaker [label: "CB-332", rating: "MCCB / 160 A / 3P"]
f2l1m = motor [label: "MTR-1168", rating: "75 kW / COMP"]
f2l2cb = breaker [label: "CB-312", rating: "MCCB / 160 A / 3P"]
f2l2m = motor [label: "MTR-1107", rating: "75 kW / COMP"]
f2l3cb = breaker [label: "CB-323", rating: "MCCB / 160 A / 3P"]
f2l3m = motor [label: "MTR-1167", rating: "75 kW / COMP"]
f3cb = breaker [label: "CB-324", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-700", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f3x = capacitor_bank [label: "CAP-628", rating: "300 kVAR"]
f4cb = breaker [label: "CB-354", rating: "MCCB / 800 A / 3P"]
f4ct = ct [label: "TA-746", rating: "3 CTs / 800/5 A"]
f4pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f4pnl = hub [label: "FD-931", rating: "3P+N"]
f4l1cb = breaker [label: "CB-377", rating: "MCCB / 160 A / 3P"]
f4l1drv = vfd [label: "DRV-820", rating: "VFD / OL"]
f4l1m = motor [label: "MTR-1106", rating: "90 kW / PROC"]
f4l2cb = breaker [label: "CB-363", rating: "MCCB / 160 A / 3P"]
f4l2drv = vfd [label: "DRV-877", rating: "VFD / OL"]
f4l2m = motor [label: "MTR-1109", rating: "90 kW / PROC"]
f4l3cb = breaker [label: "CB-365", rating: "MCCB / 160 A / 3P"]
f4l3drv = vfd [label: "DRV-830", rating: "VFD / OL"]
f4l3m = motor [label: "MTR-1160", rating: "90 kW / PROC"]
f4l4cb = breaker [label: "CB-320", rating: "MCCB / 160 A / 3P"]
f4l4drv = vfd [label: "DRV-880", rating: "VFD / OL"]
f4l4m = motor [label: "MTR-1149", rating: "90 kW / PROC"]
f5cb = breaker [label: "CB-314", rating: "MCCB / 400 A / 3P"]
f5ct = ct [label: "TA-732", rating: "3 CTs / 400/5 A"]
f5pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f5l1ld = load [label: "PNL-1476", rating: "FILTER AUXILIARIES / 60 kW"]
f5x = harmonic_filter [label: "HF-544", rating: "5th / 7th"]
f6cb = breaker [label: "CB-300", rating: "MCCB / 250 A / 3P"]
f6ct = ct [label: "TA-789", rating: "3 CTs / 250/5 A"]
f6pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f6pnl = hub [label: "FD-938", rating: "3P+N"]
f6l1ld = load [label: "PNL-1421", rating: "PLANT LIGHTING / 80 kW"]
f6l2cb = breaker [label: "CB-355", rating: "MCCB / 40 A / 3P"]
f6l2drv = vfd [label: "DRV-865", rating: "VFD / OL"]
f6l2m = motor [label: "MTR-1170", rating: "22 kW / EF"]
f6l3cb = breaker [label: "CB-319", rating: "MCCB / 40 A / 3P"]
f6l3drv = vfd [label: "DRV-861", rating: "VFD / OL"]
f6l3m = motor [label: "MTR-1118", rating: "22 kW / EF"]

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
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
f2pnl -> f2l3cb
f2l3cb -> f2l3m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3x
busB -> f4cb [cable: "3#350 MCM"]
f4cb -> f4ct
f4ct -> f4pnl
f4pnl -> f4l1cb
f4l1cb -> f4l1drv
f4l1drv -> f4l1m
f4pnl -> f4l2cb
f4l2cb -> f4l2drv
f4l2drv -> f4l2m
f4pnl -> f4l3cb
f4l3cb -> f4l3drv
f4l3drv -> f4l3m
f4pnl -> f4l4cb
f4l4cb -> f4l4drv
f4l4drv -> f4l4m
busB -> f5cb [cable: "3#4/0 AWG"]
f5cb -> f5ct
f5ct -> f5l1ld
f5ct -> f5x
busB -> f6cb [cable: "3#2/0 AWG"]
f6cb -> f6ct
f6ct -> f6pnl
f6pnl -> f6l1ld
f6pnl -> f6l2cb
f6l2cb -> f6l2drv
f6l2drv -> f6l2m
f6pnl -> f6l3cb
f6l3cb -> f6l3drv
f6l3drv -> f6l3m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
f4ct -> f4pm
f5ct -> f5pm
f6ct -> f6pm
