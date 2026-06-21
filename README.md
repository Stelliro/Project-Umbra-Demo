# Project Umbra

> **Status: early prototype — help wanted.** This is an experimental research
> build, released so others can try it, test it, and help develop it.
> Contributions of all kinds are welcome — see [CONTRIBUTING.md](CONTRIBUTING.md).
> Licensed for **noncommercial use only** under the
> [PolyForm Noncommercial License 1.0.0](LICENSE.md).

Project Umbra is a demonstration toolkit for **seed-based noise image encoding
and reconstruction**. It transforms an image into a noise-like carrier signal
using a shared seed, then reconstructs a recognizable version of the original
from that carrier. The build includes quality metrics, a command-line interface,
two desktop applications, optional GPU acceleration, and an evolutionary search
for reconstruction parameters.

## Try it now (Windows)

Download the latest early-build `.exe` from the **[Releases](../../releases)**
page and run it — no Python setup required.

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
- An adaptive, self-balancing difficulty curriculum so the search pushes toward
  the hardest channel it can still reconstruct.

## Run from source

Requires **Python 3.12**.

```bash
python -m venv .venv
# Windows:  .\.venv\Scripts\Activate.ps1
# Unix:     source .venv/bin/activate
pip install -e ".[ui]"
```

Then:

```bash
umbra smoke-test    # quick end-to-end sanity check
umbra ui            # desktop evolution explorer
python app.py       # standalone "Terminal" encode/decode tool
```

On Windows you can also double-click `launch_umbra_ui.bat` or
`launch_terminal.bat`; on first run they create the virtual environment, install
dependencies, and start the app. Optional GPU support: `pip install -e ".[gpu]"`.

## Help wanted

This is an early-stage prototype and real help is wanted — running it and
reporting results, filing bugs, improving the decoder/research, or polishing
docs. The most promising research direction is a **learned decoder** to push the
difficulty curriculum past the current Gaussian-denoiser's limit. See
[CONTRIBUTING.md](CONTRIBUTING.md) to get started.

## Testing

```bash
pip install -e ".[dev]"
pytest
```

## License

**Noncommercial use only** — [PolyForm Noncommercial License 1.0.0](LICENSE.md).
You may use, copy, modify, test, and contribute to this software for any
noncommercial purpose. You may **not** use it commercially or to make money.
Provided "as is", without warranty.

## Status

Demonstration / research prototype. Reconstructions aim for recognizability,
not bit-exact recovery.
