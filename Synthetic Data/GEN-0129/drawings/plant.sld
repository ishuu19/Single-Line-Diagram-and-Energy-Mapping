sld "GEN-0129 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-456", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1670", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-325", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-772", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "400 kW"]
mcbA2 = breaker [label: "CB-361", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-789", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1cb = breaker [label: "CB-324", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-734", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1462", rating: "AUXILIARY PANEL / 27 kW"]
f1x = harmonic_filter [label: "HF-570", rating: "5th / 7th"]
f2cb = breaker [label: "CB-351", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-725", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-376", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1172", rating: "26 kW / COMP"]
f3cb = breaker [label: "CB-306", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-741", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-369", rating: "MCCB / 80 A / 3P"]
f3l1m = motor [label: "MTR-1119", rating: "37 kW / COMP"]

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
f1ct -> f1x
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
