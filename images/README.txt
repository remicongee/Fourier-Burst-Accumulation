A Burst is Worth a Thousand Kernels: Removing 
Camera Shake via Fourier Burst Accumulation
--------------------------------------------

by M. Delbracio and G. Sapiro
ECE, Duke University.
mdelbra@gmail.com
January 2015


Any comments/suggestions please 
contact me:
mauricio delbracio
mdelbra@gmail.com


This file comes with the full resolution images
shown in the paper.


Notation:
---------

[fba]: Proposed Method (Fourier Burst Accumulation p=11)

[aa] : Align and average

[fastMBD]
F. Sroubek and P. Milanfar. 
Robust multichannel blind deconvolution via fast 
alternating minimization. IEEE Trans. Image Process., 
21(4):1687-1700, 2012.

[sparseBDB]
H. Zhang, D. Wipf, and Y. Zhang. Multi-image blind
deblurring using a coupled adaptive sparse prior. 
In CVPR, 2013. 

[gyroDeconv]
S. H. Park and M. Levoy. Gyro-based multi-image 
deconvolution for removing handshake blur. 
In CVPR, 2014. 

[joshi]
N. Joshi, M. Cohen. Seeing mt. rainier:
Lucky imaging for multi-image denoising, sharpening, 
and haze removal.
In ICCP 2010.

[Dirichlet]
Based on the global Dirichlet energy, see:
G. Haro, A. Buades,J.-M. Morel. Photographing Paintings
by Image Fusion. SIIMS Journal Journal 2012

[ZhangCham]
HDR algorithm used for Exposure fusion:
W. Zhang and W. Cham, Gradient-directed composition of 
multi-exposure images, 
CVPR 2010.

Implementation from
F. Banterle, A. Artusi, K. Debattista, and A. Chalmers, 
Advanced high dynamic range imaging: theory and practice. 
AK Peters (CRC Press), 2011.


Comments
--------

The paramenters of [fastMBD] and [sparseBDB] were set to give
the best possible performance (quality inspection). The
results of [gyroDeconv] and the anthropologie and tequila 
datasets were kindly provided by the first author of [gyroDeconv]
(S.H. Park).


DATA SET
--------

::auvers
iPad back camera
ISO 400
1/2 seconds
12 images

::woods
Canon 400D
ISO 1600
1/8 seconds
13 images

::parking night
Canon 400D
ISO 1600
1/3 seconds
10 images

::bookshelf
Canon 400D
ISO 100
1/6 seconds
10 images

::anthropologie from [gyroDeconv]
ISO 100
353 ms
8 images

::tequila from [gyroDeconv]
ISO 100
177 ms


::HDR
building
12 images, Long Exposure (LE) 1/8’’
12 images, Short Exposure (SE) 1/40’’

indoors
12 images, Long Exposure (LE) 1/4’’
12 images, Short Exposure (SE) 1/80’’

::lucky_imaging
12 images
“REG_Dirichlet_NNN.png”: 
low NNN number high Dirichlet energy

::PSF (real kernels and equivalent psf's)
14 images
sharp_000.png: Sharp image taken using a tripod
Exposure: 1/13’’
kernel/*.pgm: Estimated kernels using the sharp_000.png reference


--
