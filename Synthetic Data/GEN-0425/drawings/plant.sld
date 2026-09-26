sld "GEN-0425 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-489", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1671", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-330", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1cb = breaker [label: "CB-328", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-738", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1497", rating: "ADMIN PANEL / 65 kW"]
f2cb = breaker [label: "CB-317", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-770", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1475", rating: "ADMIN PANEL / 58 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
