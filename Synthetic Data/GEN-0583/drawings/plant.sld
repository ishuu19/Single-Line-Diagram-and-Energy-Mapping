sld "GEN-0583 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-405", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1674", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-340", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-749", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1cb = breaker [label: "CB-342", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1pnl = hub [label: "FD-973", rating: "3P+N"]
f1l1ld = load [label: "PNL-1441", rating: "ADMIN PANEL / 69 kW"]
f1l2ld = load [label: "PNL-1428", rating: "CLASSROOM LIGHTING / 39 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
