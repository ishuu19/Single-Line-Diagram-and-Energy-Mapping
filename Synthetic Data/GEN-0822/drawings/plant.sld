sld "GEN-0822 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-484", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1685", rating: "110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-355", rating: "ACB / 160 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 160/5 A"]
mpmA1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
busB = bus [label: "BUS-489", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "250 kW"]
mcbB1 = breaker [label: "CB-305", rating: "MCCB / 400 A / 3P"]
mctB1 = ct [label: "TA-765", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
tie = ats [label: "CB-374", rating: "630 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-379", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1493", rating: "RECTIFIER PDU / 38 kW"]
f2cb = breaker [label: "CB-320", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-736", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1446", rating: "RECTIFIER PDU / 41 kW"]
f3cb = breaker [label: "CB-372", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-773", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1433", rating: "AUXILIARY PANEL / 7 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
