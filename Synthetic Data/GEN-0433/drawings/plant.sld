sld "GEN-0433 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-455", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1611", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-397", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1472", rating: "SITE LIGHTING / 33 kW"]
f2cb = breaker [label: "CB-339", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-762", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1431", rating: "ACADEMIC BLOCK PANEL / 64 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
