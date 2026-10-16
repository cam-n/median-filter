# Median Filter and Rank-Order Filter (Verilog + MATLAB)

Hardware implementation of a **median filter** and a **rank-order filter** in Verilog, simulated in ModelSim and used to remove salt-and-pepper noise from a 64×64 grayscale image. MATLAB is used to prepare the noisy input image and to evaluate the filtered output.

## How It Works

1. **MATLAB** takes the input image (`imageTest1.jpg`), adds salt-and-pepper noise, and writes the 64×64 grayscale values to `oImageTest.txt`.
2. **ModelSim** runs the Verilog testbench, which reads `oImageTest.txt`, applies the median and rank-order filters, and writes the filtered values to `result.txt`.
3. **MATLAB** (`test_result.m`) reads the original and filtered images, displays the result, and calculates the error using the SSIM (Structural Similarity) function.

## Repository Structure

```
median-filter/
├── doc/                                 # Documents
│   ├── Median paper
│   ├── Panning sorter paper (rank-order)
│   └── Presentation: flow of the filter system built in ModelSim
├── src/matlab/
│   ├── imageTest1.jpg                   # Input image
│   ├── oImageTest.txt                   # 64x64 grayscale values with salt-and-pepper noise
│   └── test_result.m                    # Reads input and filtered images, shows result, computes SSIM
└── src/modelsim/
    ├── oImageTest.txt                   # 64x64 grayscale input values from MATLAB (noisy)
    ├── result.txt                       # Filtered values written by ModelSim
    ├── median_filter_img64x64_tb.v      # Testbench: median and rank-order filter
    ├── rank_order_last_version_tb.v     # Testbench: median and rank-order filter,
    │                                    #   also handles corners and borders (symmetric pixels)
    └── *.v                              # Sub-modules used by the two main systems
```

## Files

### `doc/`

| File | Description |
|---|---|
| Median paper | Reference paper for the median filter |
| Panning sorter paper | Reference paper for the rank-order filter |
| Presentation | The flow of the filter system built in ModelSim |

### `src/matlab/`

| File | Description |
|---|---|
| `imageTest1.jpg` | Input image |
| `oImageTest.txt` | 64×64 grayscale values, with salt-and-pepper noise, used as filter input in ModelSim |
| `test_result.m` | Reads the input and filtered images, displays the result, and calculates the error with SSIM |

### `src/modelsim/`

| File | Description |
|---|---|
| `oImageTest.txt` | 64×64 grayscale input values from MATLAB (with salt-and-pepper noise) |
| `result.txt` | Filtered values produced in ModelSim |
| `median_filter_img64x64_tb.v` | Verilog testbench that runs the median and rank-order filter |
| `rank_order_last_version_tb.v` | Latest version of the testbench; also filters the corners and borders using symmetric pixels |
| Other `.v` files | Sub-modules that support the two main systems above |

## Getting Started

**Requirements**
- ModelSim (simulation)
- MATLAB with the Image Processing Toolbox (for SSIM)

**Steps**

```bash
git clone https://github.com/cam-n/median-filter.git
cd median-filter
```

1. Compile the Verilog files in `src/modelsim/` in ModelSim.
2. Simulate `median_filter_img64x64_tb` (basic version) or `rank_order_last_version_tb` (with corner and border handling). Make sure `oImageTest.txt` is in the simulation working directory.
3. After the simulation, `result.txt` contains the filtered pixel values.
4. In MATLAB, open `src/matlab/test_result.m` and run it to view the result and the SSIM score.

## References

The papers on the median filter and the panning-sorter (rank-order) filter are in the `doc/` folder.

## Author

[cam-n](https://github.com/cam-n)