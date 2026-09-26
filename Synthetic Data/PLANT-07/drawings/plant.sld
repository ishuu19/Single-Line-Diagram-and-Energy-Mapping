sld "PLANT-07 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY AND BATTERY STORAGE
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-460", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8 kV UTILITY", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1699", rating: "1500 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-757", rating: "3 CTs / 2000/5 A"]
mpmA1 = demand_meter [label: "PM-1084", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 750 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-322", rating: "MCCB / 1200 A / 3P"]
mctA2 = ct [label: "TA-726", rating: "3 CTs / 1200/5 A"]
mpmA2 = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
srcA3 = ups [label: "BESS 500 kWh", voltage: "480Y/277V"]
mcbA3 = breaker [label: "CB-300", rating: "MCCB / 800 A / 3P"]
mctA3 = ct [label: "TA-788", rating: "3 CTs / 800/5 A"]
mpmA3 = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 600 A / 3P"]
f1ct = ct [label: "TA-768", rating: "3 CTs / 600/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1pnl = hub [label: "FD-929", rating: "3P+N"]
f1l1ld = load [label: "PNL-1456", rating: "ACADEMIC BLOCK / 120 kW"]
f1l2cb = breaker [label: "CB-302", rating: "MCCB / 63 A / 3P"]
f1l2drv = vfd [label: "DRV-835", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1122", rating: "37 kW / AHU"]
f1l3cb = breaker [label: "CB-386", rating: "MCCB / 63 A / 3P"]
f1l3drv = vfd [label: "DRV-863", rating: "VFD / OL"]
f1l3m = motor [label: "MTR-1192", rating: "37 kW / AHU"]
f2cb = breaker [label: "CB-307", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-791", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1469", rating: "EV CHARGING HUB / 160 kW"]
f3cb = breaker [label: "CB-381", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-767", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f3pnl = hub [label: "FD-917", rating: "3P+N"]
f3l1ld = load [label: "PNL-1435", rating: "CHILLER / 90 kW"]
f3l2cb = breaker [label: "CB-349", rating: "MCCB / 40 A / 3P"]
f3l2drv = vfd [label: "DRV-818", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1125", rating: "22 kW / CWP"]
f3l3cb = breaker [label: "CB-398", rating: "MCCB / 40 A / 3P"]
f3l3drv = vfd [label: "DRV-802", rating: "VFD / OL"]
f3l3m = motor [label: "MTR-1121", rating: "22 kW / CWP"]
f4cb = breaker [label: "CB-356", rating: "MCCB / 160 A / 3P"]
f4ct = ct [label: "TA-769", rating: "3 CTs / 160/5 A"]
f4pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f4l1ld = load [label: "PNL-1442", rating: "SITE LIGHTING / 70 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
srcA3 -> mcbA3
mcbA3 -> mctA3
mctA3 -> busA
busA -> f1cb [cable: "3#350 MCM"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
f1pnl -> f1l3cb
f1l3cb -> f1l3drv
f1l3drv -> f1l3m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2drv
f3l2drv -> f3l2m
f3pnl -> f3l3cb
f3l3cb -> f3l3drv
f3l3drv -> f3l3m
busA -> f4cb [cable: "3#1/0 AWG"]
f4cb -> f4ct
f4ct -> f4l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
mctA3 -> mpmA3
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
f4ct -> f4pm
