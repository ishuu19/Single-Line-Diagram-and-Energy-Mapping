sld "GEN-1477 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-457", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1671", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-352", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-738", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1cb = breaker [label: "CB-341", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-765", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1pnl = hub [label: "FD-941", rating: "3P+N"]
f1l1cb = breaker [label: "CB-346", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1138", rating: "12 kW / EF"]
f1l2ld = load [label: "PNL-1439", rating: "REEFER RACK PANEL / 133 kW"]
f2cb = breaker [label: "CB-334", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-731", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1438", rating: "YARD LIGHTING / 18 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
