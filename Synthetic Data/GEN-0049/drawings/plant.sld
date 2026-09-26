sld "GEN-0049 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-485", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1620", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-327", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-743", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
srcA2 = utility [label: "12.47kV STANDBY", voltage: "12.47kV"]
txA2 = transformer_yd [label: "TX-1695", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA2 = breaker [label: "CB-369", rating: "ACB / 2000 A / 3P"]
mctA2 = ct [label: "TA-783", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1cb = breaker [label: "CB-331", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1410", rating: "AUXILIARY PANEL / 8 kW"]
f2cb = breaker [label: "CB-310", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-747", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1423", rating: "AUXILIARY PANEL / 16 kW"]
f3cb = breaker [label: "CB-363", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-772", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f3pnl = hub [label: "FD-940", rating: "3P+N"]
f3l1ld = load [label: "PNL-1433", rating: "AUXILIARY PANEL / 75 kW"]
f3l2ld = load [label: "PNL-1481", rating: "AUXILIARY PANEL / 5 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
