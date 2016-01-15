#Zipcode Reader

Implementation of a homemade neural network. Working on generalizing classification to recognize all types of digits, including mnist set, mouse drawn by web user, and user uploaded images of written digits.

###Image Recognition based on homebuilt 2 layer neural net.
Early testing showed the neural net could not accurately generalize to mouse drawn digits. Attempts to help generalization included.

1. Scaling drawn image to 20x20 px and a 4px white border placed around to center and size the digit.
2. Sample 5 crops of the centered digit. Area opposite cropping replaced with blank space. 5 variations to classify, no crop, top left, top right, bottom left, bottom right. We check for most likely class across the 5 variations and return most likely.
3. Adjustment of # of hidden nodes

All 3 experiments failed to produce generalizing results. Research into convoluted neural nets is underway as next best solution.
