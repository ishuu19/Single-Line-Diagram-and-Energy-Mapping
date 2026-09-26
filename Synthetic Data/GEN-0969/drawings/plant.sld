sld "GEN-0969 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-434", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1629", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-371", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-772", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1cb = breaker [label: "CB-339", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-750", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1495", rating: "YARD LIGHTING / 19 kW"]
f2cb = breaker [label: "CB-315", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-719", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1435", rating: "YARD LIGHTING / 25 kW"]
f3cb = breaker [label: "CB-324", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-792", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f3pnl = hub [label: "FD-956", rating: "3P+N"]
f3l1ld = load [label: "PNL-1457", rating: "REEFER RACK PANEL / 133 kW"]
f3l2ld = load [label: "PNL-1489", rating: "YARD LIGHTING / 32 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
