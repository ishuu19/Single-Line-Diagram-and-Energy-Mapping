sld "GEN-0571 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-417", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1606", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-351", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-712", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
srcA2 = utility [label: "11kV STANDBY", voltage: "11kV"]
txA2 = transformer_yd [label: "TX-1667", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-309", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-706", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
srcA3 = solar [label: "PV ARRAY 218 kW", voltage: "400Y/230V"]
mcbA3 = breaker [label: "CB-369", rating: "MCCB / 630 A / 3P"]
mctA3 = ct [label: "TA-779", rating: "3 CTs / 630/5 A"]
mpmA3 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1cb = breaker [label: "CB-398", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-714", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1pnl = hub [label: "FD-967", rating: "3P+N"]
f1l1ld = load [label: "PNL-1448", rating: "ACADEMIC BLOCK PANEL / 40 kW"]
f1l2ld = load [label: "PNL-1421", rating: "ACADEMIC BLOCK PANEL / 93 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
srcA3 -> mcbA3
mcbA3 -> mctA3
mctA3 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
mctA3 -> mpmA3
f1ct -> f1pm
