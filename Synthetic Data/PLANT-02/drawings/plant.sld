sld "PLANT-02 — DATA CENTRE ELECTRICAL DISTRIBUTION"
# CRITICAL POWER SINGLE-LINE / UTILITY, GENERATOR AND UPS
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-407", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8 kV UTILITY", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1698", rating: "2000 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-386", rating: "ACB / 2500 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 2500/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
busB = bus [label: "BUS-479", voltage: "480Y/277V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "1500 kW"]
mcbB1 = breaker [label: "CB-353", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-795", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
tie = ats [label: "CB-341", rating: "2500 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-318", rating: "MCCB / 800 A / 3P"]
f1ct = ct [label: "TA-723", rating: "3 CTs / 800/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1pnl = hub [label: "FD-919", rating: "3P+N"]
f1l1ld = load [label: "PNL-1447", rating: "IT PDU / 180 kW"]
f1l2ld = load [label: "PNL-1485", rating: "IT PDU / 180 kW"]
f1l3ld = load [label: "PNL-1415", rating: "IT PDU / 180 kW"]
f2cb = breaker [label: "CB-334", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-717", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f2pnl = hub [label: "FD-978", rating: "3P+N"]
f2l1cb = breaker [label: "CB-326", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-808", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1100", rating: "45 kW / CRAC"]
f2l2cb = breaker [label: "CB-323", rating: "MCCB / 80 A / 3P"]
f2l2drv = vfd [label: "DRV-828", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1182", rating: "45 kW / CRAC"]
f2l3cb = breaker [label: "CB-357", rating: "MCCB / 80 A / 3P"]
f2l3drv = vfd [label: "DRV-880", rating: "VFD / OL"]
f2l3m = motor [label: "MTR-1161", rating: "45 kW / CRAC"]
f2l4cb = breaker [label: "CB-387", rating: "MCCB / 80 A / 3P"]
f2l4drv = vfd [label: "DRV-820", rating: "VFD / OL"]
f2l4m = motor [label: "MTR-1177", rating: "45 kW / CRAC"]
f3cb = breaker [label: "CB-384", rating: "MCCB / 800 A / 3P"]
f3ct = ct [label: "TA-758", rating: "3 CTs / 800/5 A"]
f3pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f3pnl = hub [label: "FD-957", rating: "3P+N"]
f3l1ld = load [label: "PNL-1474", rating: "IT PDU / 180 kW"]
f3l2ld = load [label: "PNL-1487", rating: "IT PDU / 180 kW"]
f3l3ld = load [label: "PNL-1473", rating: "IT PDU / 180 kW"]
f4cb = breaker [label: "CB-324", rating: "MCCB / 250 A / 3P"]
f4ct = ct [label: "TA-751", rating: "3 CTs / 250/5 A"]
f4pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f4pnl = hub [label: "FD-912", rating: "3P+N"]
f4l1cb = breaker [label: "CB-322", rating: "MCCB / 80 A / 3P"]
f4l1drv = vfd [label: "DRV-800", rating: "VFD / OL"]
f4l1m = motor [label: "MTR-1153", rating: "45 kW / CRAC"]
f4l2cb = breaker [label: "CB-360", rating: "MCCB / 80 A / 3P"]
f4l2drv = vfd [label: "DRV-817", rating: "VFD / OL"]
f4l2m = motor [label: "MTR-1156", rating: "45 kW / CRAC"]
f4l3ld = load [label: "PNL-1449", rating: "HOUSE LIGHTING / 30 kW"]
f5cb = breaker [label: "CB-356", rating: "MCCB / 160 A / 3P"]
f5ct = ct [label: "TA-741", rating: "3 CTs / 160/5 A"]
f5pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f5l1ld = load [label: "PNL-1425", rating: "UPS BYPASS PANEL / 75 kW"]

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
f1pnl -> f1l1ld
f1pnl -> f1l2ld
f1pnl -> f1l3ld
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
busB -> f3cb [cable: "3#350 MCM"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
f3pnl -> f3l3ld
busB -> f4cb [cable: "3#2/0 AWG"]
f4cb -> f4ct
f4ct -> f4pnl
f4pnl -> f4l1cb
f4l1cb -> f4l1drv
f4l1drv -> f4l1m
f4pnl -> f4l2cb
f4l2cb -> f4l2drv
f4l2drv -> f4l2m
f4pnl -> f4l3ld
busB -> f5cb [cable: "3#1/0 AWG"]
f5cb -> f5ct
f5ct -> f5l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
f4ct -> f4pm
f5ct -> f5pm
