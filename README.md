# Project Umbra

Project Umbra is a demonstration toolkit for **seed-based noise image encoding
and reconstruction**. It transforms an image into a noise-like carrier signal
using a shared seed, then reconstructs a recognizable version of the original
from that carrier. The build includes quality metrics, a command-line
interface, two desktop applications, optional GPU acceleration, and an
evolutionary search for reconstruction parameters.

## How it works

1. **Encode** — the image's pixels are permuted by a seed-derived permutation
   and combined with controlled Gaussian noise, producing a carrier that
   resembles random static.
2. **Transmit** — the carrier can be saved as a packet or converted to an audio
   waveform. The waveform may optionally be played and re-recorded through a
   speaker and microphone to model a real acoustic channel.
3. **Decode** — using the same seed, the permutation is inverted and the signal
   is denoised and corrected to recover the image.
4. **Evaluate** — reconstruction quality is measured with PSNR, SSIM, and a
   structural-overlap score.

## Features

- Seed-based noise-stream encoder and correlation decoder.
- Quality metrics: PSNR, SSIM, and a structural-overlap score.
- Command-line interface: `encode`, `decode`, `pipeline`, `evaluate`,
  `smoke-test`, and `ui`.
- Two desktop applications: a Tkinter explorer with an evolutionary
  parameter-search playground, and a customtkinter terminal for single-image
  encode/decode.
- Optional GPU acceleration via CuPy, with automatic CPU fallback and a
  configurable CPU/GPU hybrid execution mode.
- A trainable reward model with metadata-rich checkpoints that can be saved,
  loaded, and trained further.
- An adaptive difficulty controller that schedules task difficulty smoothly as
  reconstruction quality improves.

## Requirements

- Python 3.12 is recommended. See `pyproject.toml` for the full dependency list.

## Installation

```bash
python -m venv .venv
# Windows:  .\.venv\Scripts\Activate.ps1
# Unix:     source .venv/bin/activate
pip install -e ".[ui]"
```

Optional GPU support:

```bash
pip install -e ".[gpu]"
```

## Usage

Run the end-to-end pipeline and print metrics:

```bash
umbra pipeline --image input.png --seed 1234 --sigma 0.2 \
    --packet packet.npz --reconstruction recon.png
```

Encode and decode separately:

```bash
umbra encode --image input.png --output packet.npz --seed 1234 --sigma 0.25
umbra decode --packet packet.npz --output recovered.png --seed 1234
```

Validate the pipeline on a synthetic image:

```bash
umbra smoke-test
```

Launch a desktop application:

```bash
umbra ui            # Tkinter explorer
python app.py       # customtkinter terminal
```

On Windows you can double-click `launch_umbra_ui.bat` or `launch_terminal.bat`.
On first run they create a local virtual environment, install dependencies, and
start the application.

## Testing

```bash
pip install -e ".[dev]"
pytest
```

## Status

This is a demonstration build intended to showcase the encoding/decoding
pipeline and tooling. Reconstructions aim for recognizability rather than
bit-exact recovery.
