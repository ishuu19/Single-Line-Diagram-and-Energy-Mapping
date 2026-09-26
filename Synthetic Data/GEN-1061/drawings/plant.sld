sld "GEN-1061 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-481", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1655", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-369", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-730", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1cb = breaker [label: "CB-351", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-737", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-339", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-853", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1102", rating: "16 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
