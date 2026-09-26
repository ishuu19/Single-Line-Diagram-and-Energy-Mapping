sld "GEN-0618 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-462", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1639", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-349", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-780", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-791", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-338", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1179", rating: "13 kW / EF"]
f2cb = breaker [label: "CB-326", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-711", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-376", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1172", rating: "6 kW / EF"]
f3cb = breaker [label: "CB-375", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-775", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-361", rating: "MCCB / 80 A / 3P"]
f3l1m = motor [label: "MTR-1119", rating: "36 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
