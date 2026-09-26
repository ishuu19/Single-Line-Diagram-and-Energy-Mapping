sld "GEN-0543 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-474", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1611", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-350", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-779", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1cb = breaker [label: "CB-323", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-316", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-884", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1198", rating: "29 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
