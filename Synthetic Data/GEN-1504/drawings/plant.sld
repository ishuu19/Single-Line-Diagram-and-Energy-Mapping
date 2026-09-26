sld "GEN-1504 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-499", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1613", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1cb = breaker [label: "CB-361", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-743", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-359", rating: "MCCB / 25 A / 3P"]
f1l1drv = vfd [label: "DRV-802", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1127", rating: "10 kW / EF"]
f2cb = breaker [label: "CB-346", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-720", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-366", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1188", rating: "15 kW / RWP"]
f3cb = breaker [label: "CB-393", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-710", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-300", rating: "MCCB / 40 A / 3P"]
f3l1drv = vfd [label: "DRV-817", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1103", rating: "19 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
