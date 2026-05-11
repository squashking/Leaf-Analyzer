<h1 style="color: #FFB93B">
  <img src="Docs/Images/logo.png" alt="Leaf Analyzer logo" height="64" style="vertical-align: middle;">   Leaf Analyzer
</h1>


Leaf Analyzer is an open-source GUI tool for automated measurement of leaf traits—area, dimensions, perimeter, count, green index, and percent damage (e.g., herbivory/disease). The application is implemented in MATLAB and distributed as a standalone program (no MATLAB license required). Installers are available for Windows, Linux, and macOS.

A detailed description is available in our article in Plant Phenomics:
[Leaf Analyzer: A Fully Automated and Open-Source Tool for High-Throughput Leaf Trait Measurement](https://authors.elsevier.com/sd/article/S2643-6515(25)00151-7).


## Latest updates

**2026/05/05** -- :fire::fire: Leaf Analyzer online pattern generator is available, [click to customize your own pattern](https://techlauncher-leafanalyzer.github.io/Leaf-Analyzer-Pattern-Generation/).

**2026/02/13** -- :fire::fire: Leaf Analyzer v2.6.0: New Green Leaf Index (GLI) Trait Measurement + Per-Leaf Exports to Spreadsheet.

**2025/12/12** -- :fire::fire: Leaf Analyzer v2.5.0: First public release

## Example applications

<table>
  <tr>
    <td align="center"  width="20%">
      <img src="Docs/Images/IMG_3812.JPG"  width="100%"><br>
      (a)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/IMG_3812_areas.png"  width="100%"><br>
      (b)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/IMG_3812_perimeters.png"  width="100%"><br>
      (c)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/IMG_3812_dimensions.png"  width="100%"><br>
      (d)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/IMG_3812_gli.png"  width="100%"><br>
      (e)
    </td>
  </tr>
</table>
<em align="left">Figure 1. Destructive leaf morphological trait measurement: (a) Original RGB image; (b) Per-leaf area; (c) Per-leaf perimeter; (d) Per-leaf dimensions; (e) Per-leaf green index.</em><br>

<table>
  <tr>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_20230811_165626_237.jpg"  width="100%"><br>
      (a)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_20230811_165741_510.jpg"  width="100%"><br>
      (b)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_20230817_142312_435.jpg"  width="100%"><br>
      (c)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_20230817_142836_789.jpg"  width="100%"><br>
      (d)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_20230817_143923_801.jpg"  width="100%"><br>
      (e)
    </td>
  </tr>
  <tr>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_20230811_165626_237_RGB_masked.png"  width="100%"><br>
      (a)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_20230811_165741_510_masked_RGB.png"  width="100%"><br>
      (b)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_20230817_142312_435_RGB_masked.png"  width="100%"><br>
      (c)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_20230817_142836_789_RGB_masked.png"  width="100%"><br>
      (d)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_20230817_143923_801_RGB_masked.png"  width="100%"><br>
      (e)
    </td>
  </tr>

  <tr>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_5173.jpeg"  width="100%"><br>
      (a)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_5176.jpeg"  width="100%"><br>
      (b)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_5180.jpeg"  width="100%"><br>
      (c)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_5193.jpeg"  width="100%"><br>
      (d)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_5196.jpeg"  width="100%"><br>
      (e)
    </td>
  </tr>
  <tr>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_5173_masked_RGB.png"  width="100%"><br>
      (a)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_5176_masked_RGB.png"  width="100%"><br>
      (b)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_5180_masked_RGB.png"  width="100%"><br>
      (c)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_5193_masked_RGB.png"  width="100%"><br>
      (d)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Non-destructive/IMG_5196_masked_RGB.png"  width="100%"><br>
      (e)
    </td>
  </tr>
</table>
<em align="left">Figure 2. Non-destructive leaf area measurement in action. First row (a-e): original images captured with a pattern board. Second row(m-o): leaf segmentation results corresponding to first row images. Third row(k-o): original images taken with a pattern board (with plastic cover). Fourth row(p-t): leaf segmentation results corresponding to third row images.</em><br>

<p >
  <img align="center" src="Docs/Images/More_applications.png" alt="Leaf Analyzer UI" width="700">
  <br>
  <em align="left">Figure 3. More applications of Leaf Analyzer. (a-b): Petri dish plant leaf area measurement. (c-d): Petri dish seed germination monitoring, (e-f): 48-well plate hydroponic plant leaf area measurement. (g-h): nondestructive leaf area and dimensions measurement. (i-j): Silhouette leaf area measurement. (k-l): Seed counting. (m): An example root phenotyping pipeline using Leaf Analyzer.</em>
</p>


<p align="center">
  <img src="Docs/Images/UI_Screenshot.png" alt="Leaf Analyzer UI" width="700">
  <br>
  <em>Figure 4. Leaf Analyzer UI.</em>
</p>

## 1. Getting started
### 1.1. Downloading and installing Leaf Analyzer
Download the latest release from [Releases](https://github.com/squashking/Leaf-Analyzer/releases)  and install the software according to the instructions:

<table border="1" cellspacing="0" cellpadding="6">
  <tr><th>Operation System</th><th>Installation</th><th>Launching</th></tr>
  <tr><td>Windows</td><td>Double click: LeafAnalyzerInstaller2.5_Windows.exe</td><td>Open via Start Menu → Leaf Analyzer (or the desktop shortcut, if created).</td></tr>
  <tr><td>Linux</td><td>sudo ./ LeafAnalyzerInstaller2.5_Linux.install</td><td>➢ cd /usr/Leaf_Analyzer/application <br>
➢ ./run_Leaf_analyzer.sh /usr/local/MATLAB/MATLAB_Runtime/R2025a/</td></tr>
  <tr><td>Mac OS</td><td>First unzip LeafAnalyzerInstaller2.5_Mac.zip, and then 
Control-click the unzipped file
(LeafAnalyzerInstaller2.5_Mac.app) → Open</td>
<td>Open via Applications → APPN → Leaf Analyzer (or Spotlight). <br>
If your processor is ARM64 (common for devices manufactured after 2020), open a terminal, and run: <br>
arch -x86_64 open /Applications/APPN/LeafAnalyzer/application/LeafAnalyzer.app
</td>
</tr>
</table>


### 1.2. Test Leaf Analyzer with images
Leaf Analyzer requires images captured with the Leaf Analyzer calibration pattern. For quick testing, use the datasets in [Datasets](Datasets/). 

To try your own images, first capture them with the pattern (see next section). See [Capture images with the Leaf Analyzer pattern](#13-capture-images-with-the-leaf-analyzer-pattern) 

### 1.3. Capture images with the Leaf Analyzer pattern
The [Patterns](Patterns/) folder contains PDF pattern files (A4–A1). They were generated in Inkscape for high precision. You can also customize your own pattern to a suitable size using our [online pattern generator](https://techlauncher-leafanalyzer.github.io/Leaf-Analyzer-Pattern-Generation/) (Please make sure to print the generated PDF file at 100% scale for accuracy). At the top of each PDF (to the right of the logo), you’ll see labels like 120×120–15 mm, which follow the format *pattern width* × *pattern height* – *AprilTag side length*. Enter these values directly in Settings → Pattern (Fig. 2b).

<ul>
  <li>Print PDFs at 100% scale on a standard office printer.</li>
  <li>Check the pattern dimensions with a ruler after it's printed.</li>
  <li>In Leaf Analyzer, enter the exact pattern dimensions in Settings → Pattern.</li>
</ul>

> **Note:** 
1). Leaves must be placed within the Region of Interest (Fig2.a). Any objects beyond the cut-off line will be disregarded.
2). If you add text labels to the image, place them only in the reserved text region (Fig. 2a). The text must also be within 3 cm of the top border of the ROI. Currently, the text recognition model supports digits (0–9), letters (a–z, A–Z), and three special characters: dash(-), underscore(_), and dot(.). 

<table>
  <tr>
    <td align="center"><img src="Docs/Images/Leaf_Analyzer_Pattern_illustration.png" alt="Leaf Analyzer pattern details" width=300 height=350></td>
    <td align="center"><img src="Docs/Images/Pattern_tab.png" alt="Pattern dimensions setting" width=300 height=350></td>
  </tr>
</table>
<p align="center"><em>Figure 5. (a) Pattern specifications. (b) Pattern tab on the Settings panel.</em></p>



### 1.4 If your images were taken **without** the Leaf Analyzer pattern

If your images don’t include the Leaf Analyzer calibration pattern but have a **white (or light) background** and an **independent scale reference** (e.g., a ruler), you can follow the steps:

   - Overlay the four [AprilTags](Patterns/) from the Leaf Analyzer pattern onto the image (maintaining correct geometry).
   - Run Leaf Analyzer to measure traits in **pixels**. (Settings → Output → Dimension unit → pixel.)
   - Convert to metric units using a known-length object in the image (by multiplying a constant factor in the output spreadsheet file).

> **Tip:** The scale factor of area-based traits is the square of the factor for length-based traits.



### 1.5. Video Tutorials
Leaf morphological trait measurement demo
 [Youtube link](https://youtu.be/liucWnU8v48) or [Youku link](https://v.youku.com/v_show/id_XNjQ5NzA1Mzg1Ng==.html)

 Leaf damage assessment demo
 [Youtube link](https://youtu.be/od3qdbkg00o) or [Youku link](https://v.youku.com/v_show/id_XNjQ4ODk2MDUxMg==.html)


## 2. Tweak default settings (if needed)

The default settings work in most cases. In the scenarios below, you may wish to adjust them.

### 2.1 Adjust the min leaf area threshold

Leaf Analyzer applies a minimum leaf area threshold to speed up processing and suppress background noise (e.g., dirt). By default, this threshold is 5% of the largest leaf area in the image. If some small leaves are not segmented because they are much smaller than the largest leaf (Fig. 3b), lower the threshold to include them (e.g., 1%; Fig. 3c).

Where: Settings → Advanced → Min leaf area.

<table>
  <tr>
    <td align="center"><img src="Docs/Images/Tweak_min_area_RGB.jpg" alt="Tweak_min_area_RGB" width=400 height=250></td>
    <td align="center"><img src="Docs/Images/Tweak_min_area_mask_org.png" alt="Tweak_min_area_RGB - original results" width=400 height=250></td>
    <td align="center"><img src="Docs/Images/Tweak_min_area_mask_updated.png" alt="Tweak_min_area_RGB - updated results" width=400 height=250></td>
    <td align="center"><img src="Docs/Images/Settings_min_area.png" alt="Set min area threshold" width=400 height=250></td>
  </tr>
</table>
<p align="left"><em>Figure 6. (a) Original RGB image with large size variation among leaves. (b) Two very small leaves are missed with the default Min leaf area threshold. (c) All leaves are segmented after lowering the threshold to 1%. (d) Location of the Min leaf area control in the Settings panel.</em></p>

### 2.2 Toggle Fill holes
By default, Leaf Analyzer performs hole filling during post-processing to improve object completeness. This could end up with undesired results (Fig. 4b). If so, disable the option to preserve internal holes (Fig. 4c).

Where: Settings → Advanced → Fill holes (check/uncheck).

<table>
  <tr>
    <td align="center"><img src="Docs/Images/Fill_holes_RGB.jpg" alt="Fill_holes_RGB" width=400 height=250></td>
    <td align="center"><img src="Docs/Images/Fill_holes_mask_org.png" alt="Fill_holes - original results" width=400 height=250></td>
    <td align="center"><img src="Docs/Images/Fill_holes_mask_updated.png" alt="Fill holes - updated results" width=400 height=250></td>
    <td align="center"><img src="Docs/Images/Setting_fill_holes.png" alt="Fill holes button" width=400 height=250></td>
  </tr>
</table>
<p align="left"><em>Figure 7. (a) Leaf with holes/punches. (b) With Fill holes enabled (default), holes are filled. (c) Unchecking Fill holes preserves them, yielding the desired segmentation. (d) Location of the Fill holes toggle in the Settings panel. </em></p>

### 2.3 Incorporate additional features for segmentation
The proposed LBS feature works well for leaf segmentation in most cases. However, in some challenging situations, more features may need to be added to improve the segmentation. For example, when leaves have strong reflection, you may need to incorporate texture features; when dark leaves are imaged under uneven lighting, you can add the Dark Green Color
Index (DGCI) feature.

Where: Settings → Clustering → check/uncheck additional features.

<table>
  <tr>
    <td align="center"  width="20%">
      <img src="Docs/Images/IMG_5407.jpeg"  width="100%"><br>
      (a)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/IMG_5407_mask.png"  width="100%"><br>
      (b)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/IMG_5407_mask_DGCI.png"  width="100%"><br>
      (c)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/IMG_5407_mask_DGCI_LoG.png"  width="100%"><br>
      (d)
    </td>
    <td align="center"  width="20%">
      <img src="Docs/Images/Additional_features.png"  width="100%"><br>
      (e)
    </td>
  </tr>
</table>
<em align="left">Figure 8. Dark leaves under uneven lighting — (a) input image; (b) LBS segmentation binary mask with loss of peripheral leaf area; (c) LBS+DGCI segmentation binary mask; (d) LBS+DGCI+LoG segmentation binary mask, with further enhanced boundary completeness; red boxes indicate segmentation errors. (e) Location of the additional features in the Settings panel. </em><br>



### 2.4 Enable Perspective correction

Perspective correction is off by default. If images were captured at a skewed angle (not normal to the pattern plane), enabling this option can improve geometric accuracy (Fig. 5c).

Where: Settings → Advanced → Perspective correction.

<table>
  <tr>
    <td align="center"><img src="Datasets/Petiole-Pro-comparision/LA_Petiole_Acc.jpeg" alt="Fill_holes_RGB" width=400 height=250></td>
    <td align="center"><img src="Docs/Images/Perspective_correction_masked_RGB.png" alt="Fill_holes - original results" width=400 height=250></td>
    <td align="center"><img src="Docs/Images/Perspective_correction_masked_RGB_updated.png" alt="Fill holes - updated results" width=400 height=250></td>
    <td align="center"><img src="Docs/Images/Perspective_correction.png" alt="Fill holes button" width=400 height=250></td>
  </tr>
</table>
<p align="left"><em>Figure 9. (a) Image captured at an oblique angle. (b) Segmentation using default settings (perspective correction off). (c) Segmentation with Perspective correction enabled. (d) Location of the Perspective correction control in the Settings panel. </em></p>

Citation
---------------
If you find Leaf Analyzer useful in your research, please star :star: this repository and consider citing :pencil::
```
@article{LeafAnalyzer,
title = {Leaf Analyzer: A fully automated and open-source tool for high-throughput leaf trait measurement},
journal = {Plant Phenomics},
volume = {8},
number = {1},
pages = {100145},
year = {2026},
issn = {2643-6515},
doi = {https://doi.org/10.1016/j.plaphe.2025.100145},
url = {https://www.sciencedirect.com/science/article/pii/S2643651525001517},
author = {Tao Hu and Richard Poire and Danielle Way}
}  
```
Or
```
Tao Hu, Richard Poire, Danielle Way, Leaf Analyzer: A fully automated and open-source tool for high-throughput leaf trait measurement, Plant Phenomics, Volume 8, Issue 1, 2026, 100145, ISSN 2643-6515, https://doi.org/10.1016/j.plaphe.2025.100145. (https://www.sciencedirect.com/science/article/pii/S2643651525001517)
```