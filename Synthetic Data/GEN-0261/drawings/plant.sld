sld "GEN-0261 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-440", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1624", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-312", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-700", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
srcA2 = utility [label: "20kV STANDBY", voltage: "20kV"]
txA2 = transformer_yd [label: "TX-1610", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-349", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-702", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f1cb = breaker [label: "CB-356", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-738", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-393", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1196", rating: "9 kW / EF"]
f2cb = breaker [label: "CB-359", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1407", rating: "UTILITY PANEL / 17 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
