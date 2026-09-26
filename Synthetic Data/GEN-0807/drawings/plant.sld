sld "GEN-0807 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-465", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1691", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-703", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1cb = breaker [label: "CB-342", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-721", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1pnl = hub [label: "FD-999", rating: "3P+N"]
f1l1ld = load [label: "PNL-1403", rating: "YARD LIGHTING / 17 kW"]
f1l2ld = load [label: "PNL-1449", rating: "REEFER RACK PANEL / 114 kW"]
f2cb = breaker [label: "CB-310", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-725", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1489", rating: "REEFER RACK PANEL / 117 kW"]
f3cb = breaker [label: "CB-327", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-733", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1495", rating: "REEFER RACK PANEL / 115 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
