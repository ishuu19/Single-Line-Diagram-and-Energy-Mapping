sld "GEN-0369 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-480", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1606", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-341", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1cb = breaker [label: "CB-383", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-707", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1pnl = hub [label: "FD-952", rating: "3P+N"]
f1l1cb = breaker [label: "CB-359", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1138", rating: "18 kW / EF"]
f1l2cb = breaker [label: "CB-356", rating: "MCCB / 50 A / 3P"]
f1l2m = motor [label: "MTR-1166", rating: "20 kW / EF"]
f2cb = breaker [label: "CB-317", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-772", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-386", rating: "MCCB / 40 A / 3P"]
f2l1m = motor [label: "MTR-1158", rating: "17 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
