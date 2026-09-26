// Plant topology specifications for the synthetic SLD corpus.
//
// Each spec describes an electrical installation structurally; tag numbers are
// allocated deterministically from `seed` at build time so every regeneration
// reproduces the same drawing, graph and telemetry.
//
// Section  = a bus section, fed by one or more incomers (source -> [xfmr] -> CB -> CT -> bus).
// Feeder   = bus -> CB -> CT -> [panel] -> loads.
// Tie      = bus_tie linking two sections.
// States   = permitted switching configurations, as per the "PERMITTED SWITCH
//            CONFIGURATIONS" table on a real drawing.

// Load-profile archetypes. `amp` is the peak-to-mean swing of the daily cycle,
// `peak` the hour of day (local) at which demand tops out, `weekend` the
// weekend derating, `noise` the minute-to-minute relative jitter.
export const PROFILES = {
  CH:   { amp: 0.48, peak: 15, weekend: 0.72, noise: 0.012, pf: [0.88, 0.92] }, // chiller
  CHWP: { amp: 0.34, peak: 15, weekend: 0.76, noise: 0.010, pf: [0.94, 0.96] }, // chilled-water pump
  CWP:  { amp: 0.36, peak: 15, weekend: 0.74, noise: 0.010, pf: [0.94, 0.96] }, // condenser-water pump
  AHU:  { amp: 0.40, peak: 14, weekend: 0.55, noise: 0.014, pf: [0.93, 0.96] }, // air handling
  EF:   { amp: 0.22, peak: 13, weekend: 0.80, noise: 0.011, pf: [0.92, 0.95] }, // exhaust fan
  COMP: { amp: 0.30, peak: 16, weekend: 0.88, noise: 0.016, pf: [0.87, 0.91] }, // compressor
  COND: { amp: 0.34, peak: 16, weekend: 0.86, noise: 0.013, pf: [0.90, 0.94] }, // condenser
  PROC: { amp: 0.55, peak: 11, weekend: 0.25, noise: 0.022, pf: [0.85, 0.90] }, // process / production
  MILL: { amp: 0.25, peak: 10, weekend: 0.65, noise: 0.020, pf: [0.86, 0.89] }, // grinding mill
  BLOW: { amp: 0.20, peak: 12, weekend: 0.90, noise: 0.012, pf: [0.91, 0.94] }, // blower
  RWP:  { amp: 0.28, peak: 8,  weekend: 0.92, noise: 0.011, pf: [0.93, 0.95] }, // raw-water pump
  PDU:  { amp: 0.08, peak: 15, weekend: 0.97, noise: 0.006, pf: [0.97, 0.99] }, // IT / PDU
  CRAC: { amp: 0.14, peak: 15, weekend: 0.95, noise: 0.009, pf: [0.92, 0.95] }, // computer-room AC
  LTG:  { amp: 0.50, peak: 19, weekend: 0.45, noise: 0.008, pf: [0.95, 0.98] }, // lighting
  PNL:  { amp: 0.35, peak: 13, weekend: 0.50, noise: 0.012, pf: [0.92, 0.96] }, // general panel
  LIFE: { amp: 0.10, peak: 12, weekend: 0.95, noise: 0.005, pf: [0.94, 0.97] }, // life safety
  MED:  { amp: 0.30, peak: 11, weekend: 0.60, noise: 0.013, pf: [0.91, 0.95] }, // medical equipment
  BAG:  { amp: 0.60, peak: 9,  weekend: 0.70, noise: 0.025, pf: [0.88, 0.92] }, // baggage handling
  EV:   { amp: 0.70, peak: 18, weekend: 0.60, noise: 0.030, pf: [0.97, 0.99] }, // EV charging
  FEED: { amp: 0.30, peak: 14, weekend: 0.70, noise: 0.012, pf: [0.92, 0.95] }, // distribution feeder
};

export const vfd = (kw, svc, n = 1) => Array.from({ length: n }, () => ({ kind: 'vfd_motor', kw, svc }));
export const dol = (kw, svc, n = 1) => Array.from({ length: n }, () => ({ kind: 'motor', kw, svc }));
export const load = (kw, svc, label, n = 1) => Array.from({ length: n }, () => ({ kind: 'load', kw, svc, label }));

export const PLANTS = [
  // 1 ── Closest analogue to the supplied reference drawing.
  {
    id: 'PLANT-01', seed: 1011,
    name: 'Chiller Plant LV Distribution',
    title: 'PLANT ELECTRICAL DISTRIBUTION',
    subtitle: 'CONSOLIDATED SINGLE-LINE DIAGRAM / POWER, PROTECTION AND METERING',
    mv: '13.8kV', lv: '480Y/277V', llv: 480, hz: 60, tz: '-04:00',
    sections: [
      { key: 'A', baseKw: 0.0, incomers: [{ src: 'utility', srcLabel: '13.8 kV SUPPLY A', kva: 1500, xfmr: 'transformer_dy', main: '2000 A', mainType: 'ACB', ct: '2000/5 A' }] },
      { key: 'B', baseKw: 12.0, incomers: [{ src: 'utility', srcLabel: '13.8 kV SUPPLY B', kva: 1500, xfmr: 'transformer_dy', main: '2000 A', mainType: 'ACB', ct: '2000/5 A' }] },
    ],
    tie: { rating: '2000 A', note: 'NORMALLY OPEN / INTERLOCKED' },
    feeders: [
      { sec: 'A', rating: '400 A', ct: '400/5 A', panel: true, loads: vfd(22, 'CHWP', 4) },
      { sec: 'A', rating: '250 A', ct: '250/5 A', panel: true, loads: load(220, 'CH', 'PACKAGED CHILLER') },
      { sec: 'B', rating: '400 A', ct: '400/5 A', panel: true, loads: load(220, 'CH', 'PACKAGED CHILLER') },
      { sec: 'B', rating: '160 A', ct: '160/5 A', panel: true, loads: vfd(30, 'CWP', 2) },
      { sec: 'B', rating: '100 A', ct: '100/5 A', panel: true, loads: [...vfd(15, 'AHU', 2), ...load(12, 'PNL', 'AUXILIARIES')] },
    ],
  },

  // 2 ── Utility + standby generator through an ATS; dual critical bus.
  {
    id: 'PLANT-02', seed: 2022,
    name: 'Data Centre Critical Power',
    title: 'DATA CENTRE ELECTRICAL DISTRIBUTION',
    subtitle: 'CRITICAL POWER SINGLE-LINE / UTILITY, GENERATOR AND UPS',
    mv: '13.8kV', lv: '480Y/277V', llv: 480, hz: 60, tz: '-08:00',
    sections: [
      { key: 'A', baseKw: 8.5, incomers: [{ src: 'utility', srcLabel: '13.8 kV UTILITY', kva: 2000, xfmr: 'transformer_dy', main: '2500 A', mainType: 'ACB', ct: '2500/5 A' }] },
      { key: 'B', baseKw: 6.0, incomers: [{ src: 'generator', srcLabel: 'STANDBY GENERATOR', gen: '1500 kW', main: '2000 A', mainType: 'ACB', ct: '2000/5 A' }] },
    ],
    tie: { rating: '2500 A', type: 'ats', note: 'AUTOMATIC TRANSFER / OPEN TRANSITION' },
    feeders: [
      { sec: 'A', rating: '800 A', ct: '800/5 A', panel: true, loads: load(180, 'PDU', 'IT PDU', 3) },
      { sec: 'A', rating: '400 A', ct: '400/5 A', panel: true, loads: vfd(45, 'CRAC', 4) },
      { sec: 'B', rating: '800 A', ct: '800/5 A', panel: true, loads: load(180, 'PDU', 'IT PDU', 3) },
      { sec: 'B', rating: '250 A', ct: '250/5 A', panel: true, loads: [...vfd(45, 'CRAC', 2), ...load(30, 'LTG', 'HOUSE LIGHTING')] },
      { sec: 'B', rating: '160 A', ct: '160/5 A', panel: true, loads: load(75, 'LIFE', 'UPS BYPASS PANEL') },
    ],
  },

  // 3 ── Single MV supply, two step-down transformers onto one common bus.
  {
    id: 'PLANT-03', seed: 3033,
    name: 'Water Treatment Pump Station',
    title: 'WATER TREATMENT WORKS / ELECTRICAL DISTRIBUTION',
    subtitle: 'PUMP STATION SINGLE-LINE DIAGRAM',
    mv: '11kV', lv: '400Y/230V', llv: 400, hz: 50, tz: '+01:00',
    sections: [
      {
        key: 'A', baseKw: 5.5, incomers: [
          { src: 'utility', srcLabel: '11 kV INCOMER', kva: 1000, xfmr: 'transformer_dy', main: '1600 A', mainType: 'ACB', ct: '1600/5 A' },
          { src: 'utility', srcLabel: '11 kV STANDBY', kva: 1000, xfmr: 'transformer_dy', main: '1600 A', mainType: 'ACB', ct: '1600/5 A' },
        ],
      },
    ],
    tie: null,
    feeders: [
      { sec: 'A', rating: '630 A', ct: '600/5 A', panel: true, loads: vfd(90, 'RWP', 3) },
      { sec: 'A', rating: '250 A', ct: '250/5 A', panel: true, loads: vfd(37, 'BLOW', 3) },
      { sec: 'A', rating: '160 A', ct: '160/5 A', panel: true, loads: [...dol(18, 'RWP', 2), ...load(24, 'PNL', 'DOSING PANEL')] },
      { sec: 'A', rating: '100 A', ct: '100/5 A', panel: true, loads: load(45, 'PNL', 'MCC AUXILIARIES') },
    ],
  },

  // 4 ── Utility substation: HV grid, one large transformer, MV feeders.
  {
    id: 'PLANT-04', seed: 4044,
    name: 'Distribution Substation 138/13.8 kV',
    title: 'PRIMARY SUBSTATION / 138 kV - 13.8 kV',
    subtitle: 'SINGLE-LINE DIAGRAM / POWER AND PROTECTION',
    mv: '138kV', lv: '13.8kV', llv: 13800, hz: 60, tz: '-06:00',
    sections: [
      { key: 'A', baseKw: 60.0, incomers: [{ src: 'utility', srcLabel: '138 kV GRID', kva: 15000, xfmr: 'transformer_dy', main: '1200 A', mainType: 'SF6 CB', ct: '1200/5 A', arrester: true }] },
    ],
    tie: null,
    feeders: [
      { sec: 'A', rating: '600 A', ct: '600/5 A', prot: 'recloser', loads: load(2400, 'FEED', 'FEEDER 1 / INDUSTRIAL PARK') },
      { sec: 'A', rating: '600 A', ct: '600/5 A', prot: 'recloser', loads: load(1850, 'FEED', 'FEEDER 2 / TOWN NORTH') },
      { sec: 'A', rating: '600 A', ct: '600/5 A', prot: 'sectionalizer', loads: load(1320, 'FEED', 'FEEDER 3 / TOWN SOUTH') },
      { sec: 'A', rating: '200 A', ct: '200/5 A', prot: 'fuse', loads: load(280, 'PNL', 'STATION SERVICE') },
    ],
  },

  // 5 ── Industrial plant with power-factor correction and harmonic mitigation.
  {
    id: 'PLANT-05', seed: 5055,
    name: 'Manufacturing Plant Power Distribution',
    title: 'MANUFACTURING FACILITY / ELECTRICAL DISTRIBUTION',
    subtitle: 'PROCESS POWER SINGLE-LINE WITH PF CORRECTION',
    mv: '13.8kV', lv: '480Y/277V', llv: 480, hz: 60, tz: '-05:00',
    sections: [
      { key: 'A', baseKw: 14.0, incomers: [{ src: 'utility', srcLabel: '13.8 kV SUPPLY A', kva: 2000, xfmr: 'transformer_dy', main: '3000 A', mainType: 'ACB', ct: '3000/5 A' }] },
      { key: 'B', baseKw: 9.5, incomers: [{ src: 'utility', srcLabel: '13.8 kV SUPPLY B', kva: 2000, xfmr: 'transformer_yd', main: '3000 A', mainType: 'ACB', ct: '3000/5 A' }] },
    ],
    tie: { rating: '3000 A', note: 'NORMALLY OPEN / KEY INTERLOCKED' },
    feeders: [
      { sec: 'A', rating: '800 A', ct: '800/5 A', panel: true, loads: vfd(110, 'PROC', 3) },
      { sec: 'A', rating: '400 A', ct: '400/5 A', panel: true, loads: dol(75, 'COMP', 3) },
      { sec: 'A', rating: '250 A', ct: '250/5 A', extra: 'capacitor_bank', extraRating: '300 kVAR', loads: [] },
      { sec: 'B', rating: '800 A', ct: '800/5 A', panel: true, loads: vfd(90, 'PROC', 4) },
      { sec: 'B', rating: '400 A', ct: '400/5 A', extra: 'harmonic_filter', extraRating: '5th / 7th', loads: load(60, 'PNL', 'FILTER AUXILIARIES') },
      { sec: 'B', rating: '250 A', ct: '250/5 A', panel: true, loads: [...load(80, 'LTG', 'PLANT LIGHTING'), ...vfd(22, 'EF', 2)] },
    ],
  },

  // 6 ── Normal / essential branch separation per healthcare practice.
  {
    id: 'PLANT-06', seed: 6066,
    name: 'Hospital Essential Electrical System',
    title: 'HOSPITAL ELECTRICAL DISTRIBUTION',
    subtitle: 'NORMAL AND ESSENTIAL BRANCH SINGLE-LINE DIAGRAM',
    mv: '11kV', lv: '400Y/230V', llv: 400, hz: 50, tz: '+08:00',
    sections: [
      { key: 'A', baseKw: 11.0, incomers: [{ src: 'utility', srcLabel: '11 kV UTILITY', kva: 1250, xfmr: 'transformer_dy', main: '2000 A', mainType: 'ACB', ct: '2000/5 A' }] },
      { key: 'B', baseKw: 4.0, incomers: [{ src: 'generator', srcLabel: 'ESSENTIAL GENERATOR', gen: '800 kW', main: '1600 A', mainType: 'ACB', ct: '1600/5 A' }] },
    ],
    tie: { rating: '1600 A', type: 'ats', note: 'ESSENTIAL BRANCH TRANSFER' },
    feeders: [
      { sec: 'A', rating: '630 A', ct: '600/5 A', panel: true, loads: [...vfd(45, 'AHU', 3), ...load(55, 'PNL', 'WARD PANEL')] },
      { sec: 'A', rating: '400 A', ct: '400/5 A', panel: true, loads: [...load(120, 'CH', 'CHILLER UNIT'), ...vfd(22, 'CHWP', 2)] },
      { sec: 'B', rating: '250 A', ct: '250/5 A', panel: true, loads: load(85, 'LIFE', 'LIFE SAFETY BRANCH') },
      { sec: 'B', rating: '250 A', ct: '250/5 A', panel: true, loads: load(110, 'MED', 'CRITICAL BRANCH / THEATRES') },
      { sec: 'B', rating: '160 A', ct: '160/5 A', panel: true, loads: [...load(48, 'MED', 'IMAGING'), ...dol(15, 'EF', 2)] },
    ],
  },

  // 7 ── Renewable generation and storage alongside the utility supply.
  {
    id: 'PLANT-07', seed: 7077,
    name: 'Campus Solar and Storage',
    title: 'CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION',
    subtitle: 'SINGLE-LINE DIAGRAM WITH PV ARRAY AND BATTERY STORAGE',
    mv: '13.8kV', lv: '480Y/277V', llv: 480, hz: 60, tz: '-07:00',
    sections: [
      {
        key: 'A', baseKw: 7.0, incomers: [
          { src: 'utility', srcLabel: '13.8 kV UTILITY', kva: 1500, xfmr: 'transformer_dy', main: '2000 A', mainType: 'ACB', ct: '2000/5 A', meterKind: 'demand' },
          { src: 'solar', srcLabel: 'PV ARRAY 750 kW', main: '1200 A', mainType: 'MCCB', ct: '1200/5 A' },
          { src: 'ups', srcLabel: 'BESS 500 kWh', main: '800 A', mainType: 'MCCB', ct: '800/5 A' },
        ],
      },
    ],
    tie: null,
    feeders: [
      { sec: 'A', rating: '600 A', ct: '600/5 A', panel: true, loads: [...load(120, 'PNL', 'ACADEMIC BLOCK'), ...vfd(37, 'AHU', 2)] },
      { sec: 'A', rating: '400 A', ct: '400/5 A', panel: true, loads: load(160, 'EV', 'EV CHARGING HUB') },
      { sec: 'A', rating: '250 A', ct: '250/5 A', panel: true, loads: [...load(90, 'CH', 'CHILLER'), ...vfd(22, 'CWP', 2)] },
      { sec: 'A', rating: '160 A', ct: '160/5 A', panel: true, loads: load(70, 'LTG', 'SITE LIGHTING') },
    ],
  },

  // 8 ── Three-winding transformer feeding MV and LV boards.
  {
    id: 'PLANT-08', seed: 8088,
    name: 'Cement Mill MV Drive System',
    title: 'CEMENT WORKS / MILL ELECTRICAL DISTRIBUTION',
    subtitle: 'MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM',
    mv: '33kV', lv: '6.6kV', llv: 6600, hz: 50, tz: '+05:30',
    sections: [
      { key: 'A', baseKw: 40.0, incomers: [{ src: 'utility', srcLabel: '33 kV GRID', kva: 12500, xfmr: 'transformer_3winding', main: '1250 A', mainType: 'VCB', mainKind: 'breaker_vacuum', ct: '1250/5 A', arrester: true }] },
    ],
    tie: null,
    feeders: [
      { sec: 'A', rating: '630 A', ct: '600/5 A', panel: true, loads: vfd(2500, 'MILL', 1) },
      { sec: 'A', rating: '630 A', ct: '600/5 A', panel: true, loads: vfd(1800, 'MILL', 1) },
      { sec: 'A', rating: '400 A', ct: '400/5 A', panel: true, loads: [...dol(450, 'BLOW', 2), ...dol(315, 'COMP', 1)] },
      { sec: 'A', rating: '250 A', ct: '250/5 A', panel: true, loads: load(600, 'PNL', 'LV AUXILIARY BOARD') },
    ],
  },

  // 9 ── Dual utility supply with bus tie, mixed terminal services.
  {
    id: 'PLANT-09', seed: 9099,
    name: 'Airport Terminal Distribution',
    title: 'TERMINAL BUILDING / ELECTRICAL DISTRIBUTION',
    subtitle: 'CONSOLIDATED SINGLE-LINE DIAGRAM / TWO BUS SECTIONS',
    mv: '22kV', lv: '400Y/230V', llv: 400, hz: 50, tz: '+10:00',
    sections: [
      { key: 'A', baseKw: 18.0, incomers: [{ src: 'utility', srcLabel: '22 kV FEEDER A', kva: 2500, xfmr: 'transformer_dy', main: '4000 A', mainType: 'ACB', ct: '4000/5 A' }] },
      { key: 'B', baseKw: 15.5, incomers: [{ src: 'utility', srcLabel: '22 kV FEEDER B', kva: 2500, xfmr: 'transformer_dy', main: '4000 A', mainType: 'ACB', ct: '4000/5 A' }] },
    ],
    tie: { rating: '4000 A', note: 'NORMALLY OPEN / AUTO CLOSE ON LOSS' },
    feeders: [
      { sec: 'A', rating: '1000 A', ct: '1000/5 A', panel: true, loads: [...load(280, 'CH', 'CHILLER PLANT'), ...vfd(55, 'CHWP', 3)] },
      { sec: 'A', rating: '630 A', ct: '600/5 A', panel: true, loads: vfd(75, 'BAG', 4) },
      { sec: 'A', rating: '400 A', ct: '400/5 A', panel: true, loads: load(190, 'LTG', 'CONCOURSE LIGHTING') },
      { sec: 'B', rating: '1000 A', ct: '1000/5 A', panel: true, loads: vfd(90, 'AHU', 5) },
      { sec: 'B', rating: '630 A', ct: '600/5 A', panel: true, loads: load(240, 'PNL', 'RETAIL DISTRIBUTION') },
      { sec: 'B', rating: '250 A', ct: '250/5 A', panel: true, loads: [...load(60, 'LIFE', 'EMERGENCY LIGHTING'), ...dol(22, 'EF', 3)] },
    ],
  },

  // 10 ── Refrigeration-dominated load with standby generation.
  {
    id: 'PLANT-10', seed: 1100,
    name: 'Cold Storage Facility',
    title: 'COLD STORAGE / ELECTRICAL DISTRIBUTION',
    subtitle: 'REFRIGERATION PLANT SINGLE-LINE DIAGRAM',
    mv: '11kV', lv: '400Y/230V', llv: 400, hz: 50, tz: '+02:00',
    sections: [
      { key: 'A', baseKw: 10.0, incomers: [{ src: 'utility', srcLabel: '11 kV SUPPLY', kva: 1600, xfmr: 'transformer_dy', main: '2500 A', mainType: 'ACB', ct: '2500/5 A' }] },
      { key: 'B', baseKw: 3.5, incomers: [{ src: 'generator', srcLabel: 'STANDBY SET', gen: '1000 kW', main: '1600 A', mainType: 'ACB', ct: '1600/5 A' }] },
    ],
    tie: { rating: '2000 A', type: 'ats', note: 'AUTOMATIC TRANSFER / OPEN TRANSITION' },
    feeders: [
      { sec: 'A', rating: '800 A', ct: '800/5 A', panel: true, loads: vfd(160, 'COMP', 3) },
      { sec: 'A', rating: '400 A', ct: '400/5 A', panel: true, loads: vfd(45, 'COND', 4) },
      { sec: 'A', rating: '250 A', ct: '250/5 A', panel: true, loads: [...dol(30, 'EF', 3), ...load(55, 'PNL', 'DOCK PANEL')] },
      { sec: 'B', rating: '400 A', ct: '400/5 A', panel: true, loads: vfd(160, 'COMP', 1) },
      { sec: 'B', rating: '160 A', ct: '160/5 A', panel: true, loads: [...load(40, 'LTG', 'STORE LIGHTING'), ...load(35, 'LIFE', 'CONTROL ROOM')] },
    ],
  },
];
