sld "GEN-0808 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-453", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1654", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-351", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1cb = breaker [label: "CB-330", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-764", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1pnl = hub [label: "FD-967", rating: "3P+N"]
f1l1cb = breaker [label: "CB-348", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1192", rating: "6 kW / EF"]
f1l2ld = load [label: "PNL-1441", rating: "YARD LIGHTING / 19 kW"]
f2cb = breaker [label: "CB-332", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-709", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1436", rating: "REEFER RACK PANEL / 119 kW"]
f3cb = breaker [label: "CB-381", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-721", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1470", rating: "REEFER RACK PANEL / 78 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
