# Open Weather Radar Data and AI Nowcasting for Italy

Materials for the IT4LIA AI Factory seminar on radar-based precipitation nowcasting, held online on 2026-09-22 and 2026-09-23. See [AGENDA.md](AGENDA.md) for the full schedule.

The seminar has two independent modules — attendees may join either or both:

- **[`module1-radar-datasets/`](module1-radar-datasets/)** — the Italian national radar composite, radar variables, the Zarr format, and hands-on cloud-native data access via Arcodatahub.
- **[`module2-irene-nowcasting/`](module2-irene-nowcasting/)** — the IRENE nowcasting model: architecture, training pipeline, benchmarking, and a hands-on inference workflow.

Each module is a **separate Python project** with its own `pyproject.toml`, dependencies, and virtual environment — set them up independently depending on which module(s) you're attending.

## Prerequisites

- Python programming
- ML/DL fundamentals
- Basic meteorology/radar understanding is recommended but not required
- Git and a terminal
- [uv](https://docs.astral.sh/uv/) for Python dependency management ([install instructions](https://docs.astral.sh/uv/getting-started/installation/))

## Setup

### 1. Clone the repository

```bash
git clone <repository-url>
cd seminars
```

### 2. Install dependencies with uv

Run this inside whichever module folder(s) you need — it creates a local `.venv` and installs exactly the pinned dependencies from `uv.lock`:

```bash
cd module1-radar-datasets   # or module2-irene-nowcasting
uv sync
```

Repeat inside the other module's folder if you're attending both.

### 3. Configure Arcodatahub credentials

Both modules access the cloud-native radar Zarr datasets via Arcodatahub, so you'll need credentials regardless of which module you run:

1. **Create an Arcodatahub account** and add a subscription to the platform
2. **Verify your email** (check your inbox)
3. **Subscribe to the dataset**: navigate to the `italian-radar-dpc-sri.zarr` dataset and click the Subscribe button
4. **Set up credentials**:
   ```bash
   cp .env.example .env
   ```
   Then edit `.env` (in the repo root) and fill in your `ARCODATAHUB_USERNAME` and `ARCODATAHUB_ACCESS_KEY`. This file is gitignored — never commit real credentials.

### 4. (Module 2 only) Download the pretrained checkpoint

The IRENE inference notebooks need the pretrained model weights (~735 MiB), which are not stored in the repo:

```bash
cd module2-irene-nowcasting
./scripts/download_checkpoint.sh
```

This downloads `model.ckpt` into `module2-irene-nowcasting/checkpoints/`.

### 5. Verify your setup

Each module's `notebooks/` folder has a `00_setup_check.ipynb` — open it, select the module's `.venv`
as the kernel (see [Running the notebooks](#running-the-notebooks) below), and **Run All**. It checks
the kernel, every required package, ArcoDataHub connectivity, and (Module 2 only) the local
`convgru_ensemble` package and the pretrained checkpoint — no radar data is downloaded, so it finishes
in seconds. Fix anything it flags before the session starts.

## Running the notebooks

All hands-on material is in Jupyter notebooks (`notebooks/` inside each module). You need a way to run notebooks against the `.venv` you created with `uv sync`.

**Suggested: VS Code**

1. Open the module folder in VS Code (e.g. `code module1-radar-datasets`).
2. Install the [Jupyter extension](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter) and the [Python extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python) if you don't have them.
3. Open a notebook file and select the module's `.venv` (`.venv/bin/python`) as the kernel, using the kernel picker in the top-right corner.

**Alternatives**

- **JupyterLab** (already included as a dependency in both modules):
  ```bash
  cd module1-radar-datasets   # or module2-irene-nowcasting
  uv run jupyter lab
  ```
- **Any other editor/IDE with Jupyter support** (PyCharm, JupyterLab Desktop, etc.) — point it at the module's `.venv` as the Python interpreter/kernel.
- **Plain CLI**, running a notebook non-interactively:
  ```bash
  uv run jupyter nbconvert --to notebook --execute notebooks/<name>.ipynb
  ```

## Repository layout

```
.env.example                     # template for Arcodatahub credentials (shared by both modules)
AGENDA.md                        # full seminar schedule

module1-radar-datasets/
  pyproject.toml, uv.lock        # module-specific dependencies
  slides/                        # theory deck: radar composite, variables, Zarr
  notebooks/                     # hands-on: 00_setup_check first, then cloud-native access via Arcodatahub
  data/                          # sample/small radar data used in the notebooks
  resources/                     # links, papers, docs referenced in the module

module2-irene-nowcasting/
  pyproject.toml, uv.lock        # module-specific dependencies
  README.md                      # model card for the IRENE model
  slides/                        # theory deck: IRENE architecture, training, benchmarking
  notebooks/                     # hands-on: 00_setup_check first, then importance sampling, training pipeline, benchmarking, inference
  convgru_ensemble/              # IRENE model source (ConvGRU ensemble nowcasting)
  importance_sampler/            # data-cube sampling & NaN-filtering utilities
  scripts/download_checkpoint.sh # fetches the pretrained model weights
  checkpoints/                   # pretrained model weights (downloaded, not committed)
  examples/                      # sample data for quick local testing
```
