sld "GEN-1414 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-493", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1626", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-388", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1cb = breaker [label: "CB-334", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-718", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-326", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1188", rating: "9 kW / EF"]
f2cb = breaker [label: "CB-315", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-778", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1461", rating: "SALES FLOOR LIGHTING / 28 kW"]
f3cb = breaker [label: "CB-327", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-793", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f3pnl = hub [label: "FD-918", rating: "3P+N"]
f3l1cb = breaker [label: "CB-381", rating: "MCCB / 32 A / 3P"]
f3l1m = motor [label: "MTR-1155", rating: "13 kW / EF"]
f3l2cb = breaker [label: "CB-389", rating: "MCCB / 16 A / 3P"]
f3l2m = motor [label: "MTR-1178", rating: "6 kW / EF"]

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
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2cb
f3l2cb -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
