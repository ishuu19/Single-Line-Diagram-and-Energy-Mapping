sld "GEN-0078 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-406", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1610", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-369", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-744", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1cb = breaker [label: "CB-346", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1pnl = hub [label: "FD-995", rating: "3P+N"]
f1l1cb = breaker [label: "CB-347", rating: "MCCB / 200 A / 3P"]
f1l1m = motor [label: "MTR-1112", rating: "51 kW / COMP"]
f1l2ld = load [label: "PNL-1487", rating: "AUXILIARY PANEL / 86 kW"]
f1x = capacitor_bank [label: "CAP-609", rating: "145 kVAR"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-755", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1409", rating: "SHOP AUXILIARIES / 50 kW"]
f3cb = breaker [label: "CB-374", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-722", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f3pnl = hub [label: "FD-939", rating: "3P+N"]
f3l1ld = load [label: "PNL-1459", rating: "SHOP LIGHTING / 32 kW"]
f3l2ld = load [label: "PNL-1419", rating: "AUXILIARY PANEL / 88 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
f1pnl -> f1x
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
