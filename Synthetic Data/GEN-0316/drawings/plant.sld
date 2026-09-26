sld "GEN-0316 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-492", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1602", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-308", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1cb = breaker [label: "CB-366", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-773", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1425", rating: "WARD LIGHTING / 37 kW"]
f2cb = breaker [label: "CB-344", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-743", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f2pnl = hub [label: "FD-938", rating: "3P+N"]
f2l1ld = load [label: "PNL-1415", rating: "LIFE SAFETY BRANCH / 56 kW"]
f2l2ld = load [label: "PNL-1493", rating: "WARD LIGHTING / 45 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
