sld "GEN-0572 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-434", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1682", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1cb = breaker [label: "CB-305", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-714", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1pnl = hub [label: "FD-942", rating: "3P+N"]
f1l1ld = load [label: "PNL-1419", rating: "UTILITY PANEL / 13 kW"]
f1l2ld = load [label: "PNL-1421", rating: "AUXILIARY PANEL / 40 kW"]
f2cb = breaker [label: "CB-317", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-787", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-314", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1126", rating: "27 kW / COMP"]
f3cb = breaker [label: "CB-388", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-726", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f3pnl = hub [label: "FD-981", rating: "3P+N"]
f3l1cb = breaker [label: "CB-357", rating: "MCCB / 125 A / 3P"]
f3l1drv = vfd [label: "DRV-848", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1139", rating: "51 kW / PROC"]
f3l2ld = load [label: "PNL-1448", rating: "UTILITY PANEL / 13 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
