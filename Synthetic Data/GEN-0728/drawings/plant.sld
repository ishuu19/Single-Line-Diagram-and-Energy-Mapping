sld "GEN-0728 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-441", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-357", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-738", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1pnl = hub [label: "FD-992", rating: "3P+N"]
f1l1ld = load [label: "PNL-1490", rating: "REEFER RACK PANEL / 96 kW"]
f1l2ld = load [label: "PNL-1497", rating: "REEFER RACK PANEL / 87 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
