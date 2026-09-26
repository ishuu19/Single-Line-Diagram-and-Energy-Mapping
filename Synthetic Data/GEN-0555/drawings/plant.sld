sld "GEN-0555 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-482", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1632", rating: "2080 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-740", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1cb = breaker [label: "CB-311", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-702", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1479", rating: "MCC AUXILIARY BOARD / 88 kW"]
f2cb = breaker [label: "CB-313", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-731", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1481", rating: "MCC AUXILIARY BOARD / 78 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
