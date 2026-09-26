sld "GEN-0799 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-499", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1677", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-389", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-743", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "208Y/120V", rating: "210 kW"]
mcbA2 = breaker [label: "CB-360", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-776", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1cb = breaker [label: "CB-392", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-786", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1440", rating: "AUXILIARY PANEL / 13 kW"]
f2cb = breaker [label: "CB-371", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-705", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1444", rating: "AUXILIARY PANEL / 38 kW"]
f3cb = breaker [label: "CB-310", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-756", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f3pnl = hub [label: "FD-985", rating: "3P+N"]
f3l1ld = load [label: "PNL-1481", rating: "AUXILIARY PANEL / 40 kW"]
f3l2cb = breaker [label: "CB-378", rating: "MCCB / 40 A / 3P"]
f3l2m = motor [label: "MTR-1155", rating: "10 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
