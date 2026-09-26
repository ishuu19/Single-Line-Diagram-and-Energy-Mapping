sld "GEN-1338 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-493", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1669", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-323", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-750", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1cb = breaker [label: "CB-352", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-739", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1418", rating: "LIFE SAFETY BRANCH / 25 kW"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-790", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1470", rating: "CRITICAL BRANCH / 75 kW"]
f3cb = breaker [label: "CB-383", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-795", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-310", rating: "MCCB / 32 A / 3P"]
f3l1drv = vfd [label: "DRV-839", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1141", rating: "15 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
