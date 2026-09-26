sld "GEN-0784 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-470", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1631", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-355", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1cb = breaker [label: "CB-360", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1437", rating: "SHORE POWER PANEL / 63 kW"]
f2cb = breaker [label: "CB-381", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-778", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-313", rating: "MCCB / 20 A / 3P"]
f2l1m = motor [label: "MTR-1118", rating: "9 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
