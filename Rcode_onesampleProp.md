Rcode for inference with one sample proportions
===================================================

Simulate 100 coin tosses


```r
heads <- rbinom(1, size = 100, prob = 0.5)
```


Test whether about 50% heads came up in these coin tosses. This uses the normal approximation 
to the binomial distribution with or without the continuity correction


```r
prop.test(heads, 100)  # continuity correction TRUE by default
```

```
## 
## 	1-sample proportions test with continuity correction
## 
## data:  heads out of 100, null probability 0.5
## X-squared = 0.25, df = 1, p-value = 0.6171
## alternative hypothesis: true p is not equal to 0.5
## 95 percent confidence interval:
##  0.4280 0.6296
## sample estimates:
##    p 
## 0.53
```

```r
prop.test(heads, 100, correct = FALSE)  # without continuity correction
```

```
## 
## 	1-sample proportions test without continuity correction
## 
## data:  heads out of 100, null probability 0.5
## X-squared = 0.36, df = 1, p-value = 0.5485
## alternative hypothesis: true p is not equal to 0.5
## 95 percent confidence interval:
##  0.4329 0.6249
## sample estimates:
##    p 
## 0.53
```

```r
prop.test(heads, 100, conf.level = 0.95)  # confidence level of 0.95 is the default
```

```
## 
## 	1-sample proportions test with continuity correction
## 
## data:  heads out of 100, null probability 0.5
## X-squared = 0.25, df = 1, p-value = 0.6171
## alternative hypothesis: true p is not equal to 0.5
## 95 percent confidence interval:
##  0.4280 0.6296
## sample estimates:
##    p 
## 0.53
```


The exact test is based on binomial probabilities:


```r
binom.test(heads, 100)
```

```
## 
## 	Exact binomial test
## 
## data:  heads and 100
## number of successes = 53, number of trials = 100, p-value = 0.6173
## alternative hypothesis: true probability of success is not equal to 0.5
## 95 percent confidence interval:
##  0.4276 0.6306
## sample estimates:
## probability of success 
##                   0.53
```


Save the output in an object named temp.


```r
temp <- prop.test(heads, 100)
```


```names(temp)``` shows us what output is generated and the names of the output objects.


Confidence interval for the proportion of heads


```r
temp$conf.int
```

```
## [1] 0.4280 0.6296
## attr(,"conf.level")
## [1] 0.95
```


Estimated proportion


```r
temp$estimate
```

```
##    p 
## 0.53
```


Pvalue for the hypothesis test $H_0: p=0.5$ versus $H_1: p \ne 0.5$


```r
temp$p.value
```

```
## [1] 0.6171
```


