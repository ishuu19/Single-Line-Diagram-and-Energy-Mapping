sld "GEN-0460 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-483", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1652", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-328", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-770", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-752", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1pnl = hub [label: "FD-983", rating: "3P+N"]
f1l1cb = breaker [label: "CB-305", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1139", rating: "12 kW / EF"]
f1l2ld = load [label: "PNL-1487", rating: "YARD LIGHTING / 16 kW"]
f2cb = breaker [label: "CB-316", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-771", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1489", rating: "REEFER RACK PANEL / 100 kW"]
f3cb = breaker [label: "CB-388", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-755", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-304", rating: "MCCB / 16 A / 3P"]
f3l1m = motor [label: "MTR-1131", rating: "5 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
