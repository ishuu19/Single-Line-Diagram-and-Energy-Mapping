sld "GEN-0922 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-425", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1641", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-788", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1cb = breaker [label: "CB-320", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1pnl = hub [label: "FD-975", rating: "3P+N"]
f1l1ld = load [label: "PNL-1475", rating: "REEFER RACK PANEL / 99 kW"]
f1l2ld = load [label: "PNL-1415", rating: "REEFER RACK PANEL / 132 kW"]
f2cb = breaker [label: "CB-388", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-722", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-369", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1170", rating: "15 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
