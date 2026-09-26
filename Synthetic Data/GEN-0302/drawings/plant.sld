sld "GEN-0302 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-438", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1670", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-359", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-726", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1cb = breaker [label: "CB-366", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1141", rating: "31 kW / COMP"]
f2cb = breaker [label: "CB-375", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-730", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-389", rating: "MCCB / 100 A / 3P"]
f2l1m = motor [label: "MTR-1101", rating: "41 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
