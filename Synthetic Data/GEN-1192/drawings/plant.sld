sld "GEN-1192 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-461", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1609", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-786", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1000 kW"]
mcbA2 = breaker [label: "CB-332", rating: "MCCB / 1600 A / 3P"]
mctA2 = ct [label: "TA-701", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1cb = breaker [label: "CB-363", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-765", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1481", rating: "COMMON AREA LIGHTING / 51 kW"]
f2cb = breaker [label: "CB-304", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-707", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f2pnl = hub [label: "FD-901", rating: "3P+N"]
f2l1cb = breaker [label: "CB-317", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1154", rating: "15 kW / EF"]
f2l2cb = breaker [label: "CB-380", rating: "MCCB / 25 A / 3P"]
f2l2m = motor [label: "MTR-1138", rating: "12 kW / EF"]

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
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
