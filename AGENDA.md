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
| 9:00–9:15 | Recap & intro to the nowcasting problem |
| 9:15–10:15 | IRENE model architecture and design |
| 10:15–10:30 | Break |
| 10:30–11:30 | Training pipelines and optimization strategies |
| 11:30–12:00 | Performance benchmarking |
| 12:00–12:45 | Hands-on: inference workflow |
| 12:45–13:00 | Wrap-up & Q&A |

> Timing above is a draft split of the 4h blocks and needs confirmation — adjust segment lengths once slide/notebook content is scoped.

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
