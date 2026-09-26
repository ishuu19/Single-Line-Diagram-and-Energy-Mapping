sld "GEN-0786 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-421", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1618", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-332", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-758", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1cb = breaker [label: "CB-366", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1pnl = hub [label: "FD-976", rating: "3P+N"]
f1l1cb = breaker [label: "CB-393", rating: "MCCB / 160 A / 3P"]
f1l1m = motor [label: "MTR-1158", rating: "76 kW / BLOW"]
f1l2ld = load [label: "PNL-1456", rating: "MCC AUXILIARY BOARD / 60 kW"]
f1x = capacitor_bank [label: "CAP-640", rating: "147 kVAR"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-798", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1418", rating: "MCC AUXILIARY BOARD / 51 kW"]
f3cb = breaker [label: "CB-344", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-704", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-380", rating: "MCCB / 500 A / 3P"]
f3l1drv = vfd [label: "DRV-872", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1128", rating: "298 kW / MILL"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
f1pnl -> f1x
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
