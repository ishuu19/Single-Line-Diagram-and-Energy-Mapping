sld "GEN-0146 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-475", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-383", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-799", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1pnl = hub [label: "FD-926", rating: "3P+N"]
f1l1ld = load [label: "PNL-1484", rating: "YARD LIGHTING / 32 kW"]
f1l2ld = load [label: "PNL-1478", rating: "YARD LIGHTING / 30 kW"]
f2cb = breaker [label: "CB-385", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-741", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1472", rating: "YARD LIGHTING / 21 kW"]
f3cb = breaker [label: "CB-390", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-719", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-334", rating: "MCCB / 32 A / 3P"]
f3l1m = motor [label: "MTR-1107", rating: "13 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
