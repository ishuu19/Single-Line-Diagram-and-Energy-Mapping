sld "GEN-0863 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-470", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1648", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-337", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-795", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1cb = breaker [label: "CB-358", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-790", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1pnl = hub [label: "FD-982", rating: "3P+N"]
f1l1ld = load [label: "PNL-1470", rating: "WARD LIGHTING / 35 kW"]
f1l2ld = load [label: "PNL-1444", rating: "CRITICAL BRANCH / 63 kW"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-711", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1465", rating: "LIFE SAFETY BRANCH / 50 kW"]

srcA1 -> txA1
txA1 -> mcbA1
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
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
