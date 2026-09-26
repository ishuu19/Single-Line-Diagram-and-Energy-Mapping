sld "GEN-1158 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-486", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1604", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-385", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1cb = breaker [label: "CB-310", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-743", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-362", rating: "MCCB / 100 A / 3P"]
f1l1m = motor [label: "MTR-1141", rating: "42 kW / COMP"]
f2cb = breaker [label: "CB-343", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-751", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-372", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-842", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1182", rating: "59 kW / PROC"]
f2x = capacitor_bank [label: "CAP-608", rating: "102 kVAR"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2ct -> f2x
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
