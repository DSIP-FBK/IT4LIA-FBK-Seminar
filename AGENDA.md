# Forecasting Precipitation with AI and Radar Data — Seminar Outline

IT4LIA AI Factory course. Synchronous online, English.
Registration: https://eventi.cineca.it/en/hpc/forecasting-precipitation-ai-and-radar-data-national-radar-composite-and-nowcasting-models-released/20260922

Two independent modules — attendees may join either or both.

Prerequisites for attendees: Python programming; ML/DL fundamentals; basic meteorology/radar understanding recommended but not required.

## Day 1 — Tue 2026-09-22, 9:00–13:00 (CEST)
### Module 1 — Radar Datasets and Big Data Management
Materials: `module1-radar-datasets/`

| Time | Segment |
|---|---|
| 9:00–9:15 | Welcome & intro to the Italian national radar composite |
| 9:15–10:15 | Radar variables and applications |
| 10:15–10:30 | Break |
| 10:30–11:30 | Zarr format: storage and management |
| 11:30–12:45 | Hands-on: cloud-native data access via Arcodatahub |
| 12:45–13:00 | Wrap-up & Q&A |

## Day 2 — Wed 2026-09-23, 9:00–13:00 (CEST)
### Module 2 — Nowcasting Modelling with IRENE
Materials: `module2-irene-nowcasting/`

| Time | Segment |
|---|---|
| 9:00–9:45 | Nowcasting, and how to run IRENE (recap, the three approaches, hands-on with live data) |
| 9:45–10:30 | PyTorch foundations & IRENE architecture |
| 10:30–10:45 | Break |
| 10:45–11:30 | Training pipeline & optimization |
| 11:30–12:00 | Performance benchmarking vs STEPS |
| 12:00–12:45 | Hands-on: inference workflow |
| 12:45–13:00 | Wrap-up & Q&A |

> Timing above is a draft split of the 4h blocks and needs confirmation — adjust segment lengths once slide/notebook content is scoped. Module 2 was restructured on 2026-09-22 to open with a full nowcasting-and-IRENE walkthrough (using `notebooks/04_irene_live_inference.ipynb`) before the PyTorch foundations block; the closing "Hands-on: inference workflow" segment still exists but now partly overlaps it and may be trimmed once the rest of the reorg is finalized.

## Folder layout
```
module1-radar-datasets/
  slides/        # theory deck for radar composite, variables, Zarr
  notebooks/     # hands-on: Arcodatahub cloud-native access
  data/          # sample/small radar data used in the notebook
  resources/     # links, papers, docs referenced in the module
module2-irene-nowcasting/
  slides/        # theory deck for IRENE architecture, training, benchmarking
  notebooks/     # hands-on: IRENE inference workflow
  resources/     # links, papers, docs referenced in the module
```
