sld "GEN-1154 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-404", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1676", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-316", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-753", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1pnl = hub [label: "FD-978", rating: "3P+N"]
f1l1ld = load [label: "PNL-1443", rating: "LIFE SAFETY BRANCH / 35 kW"]
f1l2ld = load [label: "PNL-1488", rating: "WARD LIGHTING / 31 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
