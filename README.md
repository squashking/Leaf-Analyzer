# Leaf_Analyzer
Leaf Analyzer is an open-source, GUI software tool for automated measurement of leaf traits such as area, dimensions, perimeter, count, percentage of damage induced by disease or herbivory etc. The software is written in Matlab and has been built as standalone software, so you do not need a Matlab license to run the software. The software is currently available in Windows, Linux and Mac.

A detailed description is available in the paper published in Plant Phenomics [Leaf Analyzer: A Fully Automated and Open-Source Tool for High-Throughput Leaf Trait Measurement](https://authors.elsevier.com/sd/article/S2643-6515(25)00151-7).

![alt text](Docs/Images/UI_Screenshot.png)

## 1. Getting started
### 1.1. Downloading and installing Leaf Analyzer
Please go to the [Releases](https://github.com/squashking/Leaf-Analyzer/releases)  and download the latest version of the installers and install the software according to the instructions:

<table border="1" cellspacing="0" cellpadding="6">
  <tr><th>Operation System</th><th>Installation</th></tr>
  <tr><td>Windows</td><td>Double click: LeafAnalyzerInstaller2.5_Windows.exe</td></tr>
  <tr><td>Linux</td><td>sudo ./ LeafAnalyzerInstaller2.5_Linux.install</td></tr>
  <tr><td>Mac OS</td><td>First unzip LeafAnalyzerInstaller2.5_Mac.zip, and then 
Control-click the unzipped file
(LeafAnalyzerInstaller2.5_Mac.app) → Open</td></tr>
</table>

### 1.2. Launching the Leaf Analyzer
<table border="1" cellspacing="0" cellpadding="6">
<tr><th>
<p>Windows</p>
<p style="font-weight: normal;">Open via Start Menu → Leaf Analyzer (or the desktop shortcut, if created).</p>

<p>Linux</p>
<p style="font-weight: normal;">➢ cd /usr/Leaf_Analyzer/application <br>
➢ ./run_Leaf_analyzer.sh /usr/local/MATLAB/MATLAB_Runtime/R2025a/</p>

<p>Mac OS</p>
<p style="font-weight: normal;">Open via Applications → Leaf Analyzer (or Spotlight).</p>

</th></tr>
</table>

### 1.2. Testing Leaf Analyzer with images
Leaf Analyzer requires leaf images taken with our custom-designed pattern. For testing, you can use the image datasets provided in this repository [Datasets](Datasets/). To test your own images, see [Capturing images with Leaf Analyzer pattern](#12-capturing-images-with-leaf-analyzer-pattern) 

### 1.2. Capturing images with Leaf Analyzer pattern
In the [Patterns](Patterns/) folder, you can find a few pdf pattern files of different sizes (from A4 to A1) as well as a word file of the pattern template. The pdf pattern files were designed and generated using Inkscape for high precision. To use these files, you just need to print them on an office printer at 100% scale. You can also use the Word file to customize your own pattern size. When you run Leaf Analyzer, please remember to input the correct pattern dimensions on the _Settings_ panel under the _Pattern_ tab.

### 1.3. Video Tutorials
Leaf morphological trait measurement demo
 [youtube link](https://youtu.be/liucWnU8v48)

 Leaf damage assessment demo
 [youtube link](https://youtu.be/od3qdbkg00o)



