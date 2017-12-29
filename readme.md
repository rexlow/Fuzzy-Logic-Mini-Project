# Bankruptcy Prediction System with Fuzzy Logic

We have taken 3 approaches in order to complete this assignment and this markdown file serves to explain their differences.

## 1. MATLAB GUI Fuzzy Toolbox

With MATLAB GUI Fuzzy Toolbox, we defined membership functions for all 6 variables in the `Membership Function Editor (⌘+2)`. Also, we defined 67 rules in the `Rule Viewer (⌘+5)` which are extracted from the paper, [The discovery of experts’ decision rules from qualitative bankruptcy data using genetic algorithms](https://www.sciencedirect.com/science/article/pii/S0957417403001027).

### To run
1. Make sure to point working directory to `fuzzy toolbox (MATLAB)` folder.
2. Launch MATLAB app, type `fuzzy` in the command window.
3. Click File, Import From File, select `FuzzyMiniProject.fis` from .

### To evaluate
1. Make sure to point working directory to `fuzzy toolbox (MATLAB)` folder.
2. Type `fis = readfis('FuzzyMiniProject')`
3. Our Fuzzy Inference System will accept 6 value (0-10) as input variable.
4. Type `fis.input.range` to view input range.
5. Type `output = evalfis([1;2;3;4;5;6], fis)`

## 2. MATLAB GENFIS3 (FCM)

Given separate sets of input and output data, `genfis3` generates a fuzzy inference system (FIS) using FCM clustering. With an appropriate set of numerical data, a FIS will be generated along with membership functions and rules. 

However, upon further inspection of the data, we reckoned that our data (which is categorical data) tends to cluster really bad beyond counting duplicates. It is simply irrelavant to do fuzzy clustering on our dataset. As a result, our FCM produced a rather rigid calculation due to the nature of our data. We believe our work can be improved in the future by using an `Adaptive Neuro-Fuzzy Inference System (ANFIS)` as a classifier.

Regardless, it is possible to run our work with MATLAB and expect results. Data is being loaded and parsed as numerical data. 80% of the data is used for training and the rest is used for testing.

### To run
1. Make sure to point working directory to `genfis3 (MATLAB)` folder.
2. Open script by double clicking on `run.m` in the project directory menu.
3. Press `⌘+enter` to run the script. A `2x8` figure will be generated to visualize FIS surface and membership functions for both input and output variables.
4. Type `showrule(fis)` to show rules.
5. Type `output = evalfis([1;1;1;3;1;1], fis)` to generate output.