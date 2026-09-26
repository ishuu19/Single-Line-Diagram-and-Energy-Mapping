sld "GEN-0006 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-487", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1605", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-380", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-718", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1cb = breaker [label: "CB-307", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-336", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1132", rating: "14 kW / EF"]
f2cb = breaker [label: "CB-361", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-729", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1440", rating: "REEFER RACK PANEL / 79 kW"]
f3cb = breaker [label: "CB-365", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-745", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1420", rating: "REEFER RACK PANEL / 140 kW"]

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
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
