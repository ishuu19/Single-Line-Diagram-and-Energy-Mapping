sld "GEN-1520 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-436", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1687", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-373", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-721", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
busB = bus [label: "BUS-403", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1000 kW"]
mcbB1 = breaker [label: "CB-310", rating: "MCCB / 1600 A / 3P"]
mctB1 = ct [label: "TA-700", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
tie = ats [label: "CB-311", rating: "2000 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-341", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-738", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1495", rating: "AUXILIARY PANEL / 55 kW"]
f2cb = breaker [label: "CB-370", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-758", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1410", rating: "AUXILIARY PANEL / 10 kW"]
f3cb = breaker [label: "CB-397", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-791", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-307", rating: "MCCB / 80 A / 3P"]
f3l1m = motor [label: "MTR-1122", rating: "32 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
