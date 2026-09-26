sld "PLANT-09 — TERMINAL BUILDING / ELECTRICAL DISTRIBUTION"
# CONSOLIDATED SINGLE-LINE DIAGRAM / TWO BUS SECTIONS
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-468", voltage: "400Y/230V"]
srcA1 = utility [label: "22 kV FEEDER A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1637", rating: "2500 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-375", rating: "ACB / 4000 A / 3P"]
mctA1 = ct [label: "TA-729", rating: "3 CTs / 4000/5 A"]
mpmA1 = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
busB = bus [label: "BUS-428", voltage: "400Y/230V"]
srcB1 = utility [label: "22 kV FEEDER B", voltage: "22kV"]
txB1 = transformer_dy [label: "TX-1604", rating: "2500 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-334", rating: "ACB / 4000 A / 3P"]
mctB1 = ct [label: "TA-758", rating: "3 CTs / 4000/5 A"]
mpmB1 = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
tie = bus_tie [label: "CB-377", rating: "4000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-382", rating: "MCCB / 1000 A / 3P"]
f1ct = ct [label: "TA-788", rating: "3 CTs / 1000/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1pnl = hub [label: "FD-957", rating: "3P+N"]
f1l1ld = load [label: "PNL-1408", rating: "CHILLER PLANT / 280 kW"]
f1l2cb = breaker [label: "CB-320", rating: "MCCB / 125 A / 3P"]
f1l2drv = vfd [label: "DRV-834", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1125", rating: "55 kW / CHWP"]
f1l3cb = breaker [label: "CB-339", rating: "MCCB / 125 A / 3P"]
f1l3drv = vfd [label: "DRV-892", rating: "VFD / OL"]
f1l3m = motor [label: "MTR-1118", rating: "55 kW / CHWP"]
f1l4cb = breaker [label: "CB-309", rating: "MCCB / 125 A / 3P"]
f1l4drv = vfd [label: "DRV-826", rating: "VFD / OL"]
f1l4m = motor [label: "MTR-1128", rating: "55 kW / CHWP"]
f2cb = breaker [label: "CB-359", rating: "MCCB / 630 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 600/5 A"]
f2pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f2pnl = hub [label: "FD-941", rating: "3P+N"]
f2l1cb = breaker [label: "CB-372", rating: "MCCB / 160 A / 3P"]
f2l1drv = vfd [label: "DRV-843", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1136", rating: "75 kW / BAG"]
f2l2cb = breaker [label: "CB-307", rating: "MCCB / 160 A / 3P"]
f2l2drv = vfd [label: "DRV-876", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1152", rating: "75 kW / BAG"]
f2l3cb = breaker [label: "CB-302", rating: "MCCB / 160 A / 3P"]
f2l3drv = vfd [label: "DRV-835", rating: "VFD / OL"]
f2l3m = motor [label: "MTR-1159", rating: "75 kW / BAG"]
f2l4cb = breaker [label: "CB-358", rating: "MCCB / 160 A / 3P"]
f2l4drv = vfd [label: "DRV-867", rating: "VFD / OL"]
f2l4m = motor [label: "MTR-1114", rating: "75 kW / BAG"]
f3cb = breaker [label: "CB-347", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-792", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1490", rating: "CONCOURSE LIGHTING / 190 kW"]
f4cb = breaker [label: "CB-394", rating: "MCCB / 1000 A / 3P"]
f4ct = ct [label: "TA-789", rating: "3 CTs / 1000/5 A"]
f4pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f4pnl = hub [label: "FD-983", rating: "3P+N"]
f4l1cb = breaker [label: "CB-333", rating: "MCCB / 200 A / 3P"]
f4l1drv = vfd [label: "DRV-875", rating: "VFD / OL"]
f4l1m = motor [label: "MTR-1116", rating: "90 kW / AHU"]
f4l2cb = breaker [label: "CB-318", rating: "MCCB / 200 A / 3P"]
f4l2drv = vfd [label: "DRV-866", rating: "VFD / OL"]
f4l2m = motor [label: "MTR-1170", rating: "90 kW / AHU"]
f4l3cb = breaker [label: "CB-370", rating: "MCCB / 200 A / 3P"]
f4l3drv = vfd [label: "DRV-877", rating: "VFD / OL"]
f4l3m = motor [label: "MTR-1142", rating: "90 kW / AHU"]
f4l4cb = breaker [label: "CB-313", rating: "MCCB / 200 A / 3P"]
f4l4drv = vfd [label: "DRV-807", rating: "VFD / OL"]
f4l4m = motor [label: "MTR-1168", rating: "90 kW / AHU"]
f4l5cb = breaker [label: "CB-311", rating: "MCCB / 200 A / 3P"]
f4l5drv = vfd [label: "DRV-878", rating: "VFD / OL"]
f4l5m = motor [label: "MTR-1183", rating: "90 kW / AHU"]
f5cb = breaker [label: "CB-316", rating: "MCCB / 630 A / 3P"]
f5ct = ct [label: "TA-736", rating: "3 CTs / 600/5 A"]
f5pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f5l1ld = load [label: "PNL-1445", rating: "RETAIL DISTRIBUTION / 240 kW"]
f6cb = breaker [label: "CB-308", rating: "MCCB / 250 A / 3P"]
f6ct = ct [label: "TA-728", rating: "3 CTs / 250/5 A"]
f6pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f6pnl = hub [label: "FD-956", rating: "3P+N"]
f6l1ld = load [label: "PNL-1434", rating: "EMERGENCY LIGHTING / 60 kW"]
f6l2cb = breaker [label: "CB-323", rating: "MCCB / 50 A / 3P"]
f6l2m = motor [label: "MTR-1196", rating: "22 kW / EF"]
f6l3cb = breaker [label: "CB-336", rating: "MCCB / 50 A / 3P"]
f6l3m = motor [label: "MTR-1166", rating: "22 kW / EF"]
f6l4cb = breaker [label: "CB-371", rating: "MCCB / 50 A / 3P"]
f6l4m = motor [label: "MTR-1175", rating: "22 kW / EF"]

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
busA -> f1cb [cable: "4#500 MCM"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
f1pnl -> f1l3cb
f1l3cb -> f1l3drv
f1l3drv -> f1l3m
f1pnl -> f1l4cb
f1l4cb -> f1l4drv
f1l4drv -> f1l4m
busA -> f2cb [cable: "3#350 MCM"]
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
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
busB -> f4cb [cable: "4#500 MCM"]
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
f4pnl -> f4l5cb
f4l5cb -> f4l5drv
f4l5drv -> f4l5m
busB -> f5cb [cable: "3#350 MCM"]
f5cb -> f5ct
f5ct -> f5l1ld
busB -> f6cb [cable: "3#2/0 AWG"]
f6cb -> f6ct
f6ct -> f6pnl
f6pnl -> f6l1ld
f6pnl -> f6l2cb
f6l2cb -> f6l2m
f6pnl -> f6l3cb
f6l3cb -> f6l3m
f6pnl -> f6l4cb
f6l4cb -> f6l4m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
f4ct -> f4pm
f5ct -> f5pm
f6ct -> f6pm
