sld "GEN-0871 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-452", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1698", rating: "2080 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-332", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
busB = bus [label: "BUS-491", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_dy [label: "TX-1610", rating: "1730 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-305", rating: "ACB / 2500 A / 3P"]
mctB1 = ct [label: "TA-761", rating: "3 CTs / 2500/5 A"]
mpmB1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
tie = bus_tie [label: "CB-374", rating: "1600 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-331", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1452", rating: "MCC AUXILIARY BOARD / 80 kW"]
f2cb = breaker [label: "CB-339", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-745", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-342", rating: "MCCB / 320 A / 3P"]
f2l1m = motor [label: "MTR-1193", rating: "133 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
