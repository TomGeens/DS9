The 1979 Welding Fume App
========================================================
author: Tom Geens
date: 19/02/2016
autosize: true

The 1979 Welding Fume Dataset
========================================================
In 1979, [Evans, Ingle, Molyneux, Sharp and Swain](https://annhyg.oxfordjournals.org/content/22/1/1.abstract",target="_new"),  published a paper on welding fume exposure. The dataset contains 25 samples representing workers' exposure in mg/m³.


```r
wf<-c(8.8,3.9,7.3,17.0,23.1,6.7,5.2,4.8,2.5,5.8,4.2,27.9,1.0)
wf<-c(wf,6.9,20.5,5.3,25.2,19.1,8.5,6.0,15.0,25.8,14.6,9.2,11)
lnwf<-log(wf); welding<-data.frame(wf,lnwf); summary(welding)
```

```
       wf             lnwf      
 Min.   : 1.00   Min.   :0.000  
 1st Qu.: 5.30   1st Qu.:1.668  
 Median : 8.50   Median :2.140  
 Mean   :11.41   Mean   :2.162  
 3rd Qu.:17.00   3rd Qu.:2.833  
 Max.   :27.90   Max.   :3.329  
```

Histograms of the original and log-transformed values
========================================================

Original data (lognormal)
![plot of chunk unnamed-chunk-2](Welding1979-figure/unnamed-chunk-2-1.png)

***

Log-transformed data (normal)
![plot of chunk unnamed-chunk-3](Welding1979-figure/unnamed-chunk-3-1.png)


The application
========================================================
The app is hosted on [http://www.shinyapps.io/](http://www.shinyapps.io/) under my own account. You can access it [here](https://tgeens.shinyapps.io/Welding1979/).

The app visualises histograms of random subsamples from the dataset:
- with the slider, you can sample (without replacement) n measurements  
- with the checkbox, you can overlay lognormal and normal density plots
- each time you change the slider and press submit, a new subsample is drawn  

Summary
========================================================
![alt text](Fig1.png)

***

- the app visualises random subsampling
- shows lognormal character of exposure
- shows means on original and log-scales
- combines histograms and density plots 
- easy input: slider and checkbox
