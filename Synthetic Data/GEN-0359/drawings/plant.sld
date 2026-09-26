sld "GEN-0359 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-428", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1686", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-328", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
srcA2 = utility [label: "20kV STANDBY", voltage: "20kV"]
mcbA2 = breaker [label: "CB-399", rating: "MCCB / 1000 A / 3P"]
mctA2 = ct [label: "TA-722", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-720", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1416", rating: "YARD LIGHTING / 18 kW"]
f2cb = breaker [label: "CB-348", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-769", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1443", rating: "AUXILIARY PANEL / 15 kW"]
f3cb = breaker [label: "CB-336", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-756", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f3pnl = hub [label: "FD-996", rating: "3P+N"]
f3l1cb = breaker [label: "CB-307", rating: "MCCB / 16 A / 3P"]
f3l1m = motor [label: "MTR-1143", rating: "7 kW / EF"]
f3l2ld = load [label: "PNL-1409", rating: "REEFER RACK PANEL / 68 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
