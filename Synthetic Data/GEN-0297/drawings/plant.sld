sld "GEN-0297 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-414", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1617", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-326", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-749", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1000 kW"]
mcbA2 = breaker [label: "CB-344", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-723", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1cb = breaker [label: "CB-306", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-746", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-310", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1165", rating: "30 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
