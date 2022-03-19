
README
---------------------------------------------------------------------------------------------

./doc (documents), included:
- Median paper
- Panning sorter paper (rank-order)
- Presentation : the flow of filter system that was builded in Modelsim.

----------------------------------------------------------------------------------------------

./sourcecode/matlab

- imageTest1.jpg : input image.
- oImageTest.txt : 64x64 grayscale values for filter later in Modelsim
 (contains the noise salt&peper).
- test_result.m  : matlab source code to read input image and read filtered image, display the 
result and calculate the error (using SSIM function).



./sourcecode/modelsim

- oImageTest.txt : 64x64 grayscale input values from Matlab (contains the noise salt&peper).
- result.txt : the .txt file that contains the filterd values in Modelsim.
- median_filter_img64x64_tb.v : the Verilog file that run median and rank-order filter in 
Modelsim.
- rank_order_last_version_tb.v : the Verilog file that run median and rank-order filter in 
Modelsim. In addition, this system process median and rank-order filter at the corners and borders
(symmetric pixels).
- Others Verilog file : the sub systems support two-upper-main-systems.


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++