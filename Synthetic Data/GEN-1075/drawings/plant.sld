sld "GEN-1075 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-430", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1615", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-324", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-708", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
srcA2 = utility [label: "22kV STANDBY", voltage: "22kV"]
mcbA2 = breaker [label: "CB-338", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-757", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-359", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1pnl = hub [label: "FD-900", rating: "3P+N"]
f1l1ld = load [label: "PNL-1480", rating: "FLOOR LIGHTING / 70 kW"]
f1l2ld = load [label: "PNL-1488", rating: "FLOOR LIGHTING / 36 kW"]
f2cb = breaker [label: "CB-319", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-743", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f2pnl = hub [label: "FD-903", rating: "3P+N"]
f2l1ld = load [label: "PNL-1420", rating: "TENANT PANEL / 86 kW"]
f2l2ld = load [label: "PNL-1456", rating: "TENANT PANEL / 84 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
