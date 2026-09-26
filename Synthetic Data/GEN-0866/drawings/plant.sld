sld "GEN-0866 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-462", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1689", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-361", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "250 kW"]
mcbA2 = breaker [label: "CB-377", rating: "ACB / 400 A / 3P"]
mctA2 = ct [label: "TA-770", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1cb = breaker [label: "CB-345", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-702", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-342", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1112", rating: "13 kW / EF"]
f2cb = breaker [label: "CB-393", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-732", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f2pnl = hub [label: "FD-920", rating: "3P+N"]
f2l1ld = load [label: "PNL-1423", rating: "AUXILIARY PANEL / 20 kW"]
f2l2ld = load [label: "PNL-1460", rating: "AUXILIARY PANEL / 20 kW"]
f3cb = breaker [label: "CB-331", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-787", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1443", rating: "TENANT PANEL / 59 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
