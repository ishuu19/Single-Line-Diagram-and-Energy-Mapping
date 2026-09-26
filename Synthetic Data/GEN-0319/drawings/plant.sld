sld "GEN-0319 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-473", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1622", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-395", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-755", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-382", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1124", rating: "12 kW / EF"]
f2cb = breaker [label: "CB-326", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-754", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f2pnl = hub [label: "FD-923", rating: "3P+N"]
f2l1cb = breaker [label: "CB-398", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1128", rating: "26 kW / COND"]
f2l2cb = breaker [label: "CB-339", rating: "MCCB / 63 A / 3P"]
f2l2m = motor [label: "MTR-1158", rating: "29 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
