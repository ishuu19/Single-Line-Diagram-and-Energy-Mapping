sld "GEN-0432 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-421", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1615", rating: "2490 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-748", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1pnl = hub [label: "FD-917", rating: "3P+N"]
f1l1ld = load [label: "PNL-1495", rating: "MCC AUXILIARY BOARD / 50 kW"]
f1l2cb = breaker [label: "CB-361", rating: "MCCB / 320 A / 3P"]
f1l2m = motor [label: "MTR-1136", rating: "170 kW / BLOW"]
f2cb = breaker [label: "CB-363", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-754", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-348", rating: "MCCB / 320 A / 3P"]
f2l1m = motor [label: "MTR-1143", rating: "150 kW / BLOW"]
f3cb = breaker [label: "CB-346", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-778", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1434", rating: "MCC AUXILIARY BOARD / 75 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
