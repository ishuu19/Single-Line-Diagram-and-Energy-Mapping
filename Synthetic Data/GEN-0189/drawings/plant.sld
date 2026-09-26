sld "GEN-0189 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-423", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1637", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-339", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-724", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-328", rating: "MCCB / 250 A / 3P"]
f1l1m = motor [label: "MTR-1141", rating: "116 kW / BLOW"]
f2cb = breaker [label: "CB-350", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-741", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-371", rating: "MCCB / 320 A / 3P"]
f2l1m = motor [label: "MTR-1135", rating: "148 kW / BLOW"]
f3cb = breaker [label: "CB-387", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-798", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1427", rating: "MCC AUXILIARY BOARD / 68 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
