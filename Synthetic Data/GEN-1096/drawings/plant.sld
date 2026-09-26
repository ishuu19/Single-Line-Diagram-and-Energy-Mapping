sld "GEN-1096 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-426", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1644", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-376", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1cb = breaker [label: "CB-359", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1433", rating: "REEFER RACK PANEL / 106 kW"]
f2cb = breaker [label: "CB-313", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-775", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f2pnl = hub [label: "FD-969", rating: "3P+N"]
f2l1ld = load [label: "PNL-1447", rating: "YARD LIGHTING / 16 kW"]
f2l2cb = breaker [label: "CB-333", rating: "MCCB / 16 A / 3P"]
f2l2m = motor [label: "MTR-1187", rating: "5 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
