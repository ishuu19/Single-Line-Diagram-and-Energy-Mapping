sld "GEN-1308 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-475", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1612", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-370", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-794", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 272 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-381", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-754", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1cb = breaker [label: "CB-352", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1459", rating: "FORECOURT LIGHTING / 23 kW"]
f2cb = breaker [label: "CB-302", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-767", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1439", rating: "FORECOURT LIGHTING / 18 kW"]
f3cb = breaker [label: "CB-369", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-758", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1449", rating: "FORECOURT LIGHTING / 10 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
