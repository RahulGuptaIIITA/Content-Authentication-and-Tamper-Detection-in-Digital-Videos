# Content Authentication And Tamper Detection In Digital Videos.
A peice of code for detecting scene breaks, frames insertion, as well as authenticating the content using watermark technique
which can be a text, image, video etc.

# Proposed Approach For Tamper Detection
Since during an insertion or dissolve(smoothly removed), new intensity edges appear far from the location of old edges. 
Similarly, old edges disappear far from the location of new edges. We define an edge pixel that appears far from an existing 
edge pixel as an entering edge pixel, and an edge pixel that disappears far from an existing edge pixel as an entering pixel. 

In this approach, we first take two consecutive frames from video, let that be A and B, then applying edge detection technique 
we generate two corresponding binary images let I, I’. Let the po be the fraction of exiting edge pixel and pi be the fraction 
of entering edge pixel. We define p= diff(pi,po) as the fraction of changed edges, Which will be the basis of measuring 
dissimilarity between two images. An insertion of frame or dissolve can be detected by looking at peak value of p. 


If there is any frame inserted then we can identify that by the sharp change in the p value and if that value is higher than 
the threshold r. Similarly, if there is any dissolve/ cutting of frame then the change in pixel would be detected.

We draw graph of the change in the pixel's intensity. If there is a strange peak then the video is altered.

# Proposed Approach For Content Authentication
We used 'LSB watermarking' technique. The idea behind this watermarking technique is the following: 
if you see you image as a matrix NxM (where N and M are the dimension of the image) you can represent the value of the pixel 
in the position (i,j) as a binary number; this binary can be then divided in all of its bit, so that you will have a most 
significant bit (the one that contains quite a lot of information, and a least significant bit that contains few information).

If your image is for example in gray scale, you can make changes to the value of the LSB without any perceptible distortion 
for the human user therefore you can think of taking the LSB of an image (the cover image) and change its value in every pixel 
with the MSB of another image, that we would like to embed in a secret/non perceptible way in the cover image).
