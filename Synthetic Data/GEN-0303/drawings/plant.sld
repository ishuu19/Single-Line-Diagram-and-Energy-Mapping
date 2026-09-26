sld "GEN-0303 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-446", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1680", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-398", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-791", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1pnl = hub [label: "FD-927", rating: "3P+N"]
f1l1ld = load [label: "PNL-1442", rating: "LIFE SAFETY BRANCH / 49 kW"]
f1l2ld = load [label: "PNL-1487", rating: "LIFE SAFETY BRANCH / 32 kW"]
f2cb = breaker [label: "CB-387", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-726", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1447", rating: "WARD LIGHTING / 45 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
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
