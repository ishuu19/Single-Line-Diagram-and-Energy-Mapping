sld "GEN-0778 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-432", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1649", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-356", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-747", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
busB = bus [label: "BUS-416", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1646", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-362", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-703", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
tie = bus_tie [label: "CB-331", rating: "2000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-301", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1449", rating: "CRITICAL BRANCH / 36 kW"]
f2cb = breaker [label: "CB-375", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1447", rating: "CRITICAL BRANCH / 35 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
