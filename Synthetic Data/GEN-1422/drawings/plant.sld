sld "GEN-1422 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-453", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1696", rating: "1730 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-329", rating: "MCCB / 2500 A / 3P"]
mctA1 = ct [label: "TA-721", rating: "3 CTs / 2500/5 A"]
mpmA1 = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1cb = breaker [label: "CB-377", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1475", rating: "MCC AUXILIARY BOARD / 76 kW"]
f1x = capacitor_bank [label: "CAP-608", rating: "116 kVAR"]
f2cb = breaker [label: "CB-399", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-720", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1476", rating: "MCC AUXILIARY BOARD / 70 kW"]
f3cb = breaker [label: "CB-393", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-744", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f3pnl = hub [label: "FD-999", rating: "3P+N"]
f3l1cb = breaker [label: "CB-360", rating: "MCCB / 320 A / 3P"]
f3l1m = motor [label: "MTR-1154", rating: "146 kW / BLOW"]
f3l2ld = load [label: "PNL-1495", rating: "MCC AUXILIARY BOARD / 71 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
f1ct -> f1x
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
