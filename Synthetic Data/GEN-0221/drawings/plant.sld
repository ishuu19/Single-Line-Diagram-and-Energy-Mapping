sld "GEN-0221 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-483", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1624", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-358", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-793", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-712", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1pnl = hub [label: "FD-997", rating: "3P+N"]
f1l1ld = load [label: "PNL-1470", rating: "WARD LIGHTING / 26 kW"]
f1l2ld = load [label: "PNL-1497", rating: "WARD LIGHTING / 43 kW"]
f2cb = breaker [label: "CB-324", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-792", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1453", rating: "LIFE SAFETY BRANCH / 32 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
