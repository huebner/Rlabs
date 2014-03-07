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
## X-squared = 0.09, df = 1, p-value = 0.7642
## alternative hypothesis: true p is not equal to 0.5
## 95 percent confidence interval:
##  0.4183 0.6201
## sample estimates:
##    p 
## 0.52
```

```r
prop.test(heads, 100, correct = FALSE)  # without continuity correction
```

```
## 
## 	1-sample proportions test without continuity correction
## 
## data:  heads out of 100, null probability 0.5
## X-squared = 0.16, df = 1, p-value = 0.6892
## alternative hypothesis: true p is not equal to 0.5
## 95 percent confidence interval:
##  0.4232 0.6154
## sample estimates:
##    p 
## 0.52
```

```r
prop.test(heads, 100, conf.level = 0.95)  # confidence level of 0.95 is the default
```

```
## 
## 	1-sample proportions test with continuity correction
## 
## data:  heads out of 100, null probability 0.5
## X-squared = 0.09, df = 1, p-value = 0.7642
## alternative hypothesis: true p is not equal to 0.5
## 95 percent confidence interval:
##  0.4183 0.6201
## sample estimates:
##    p 
## 0.52
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
## number of successes = 52, number of trials = 100, p-value = 0.7644
## alternative hypothesis: true probability of success is not equal to 0.5
## 95 percent confidence interval:
##  0.4178 0.6210
## sample estimates:
## probability of success 
##                   0.52
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
## [1] 0.4183 0.6201
## attr(,"conf.level")
## [1] 0.95
```


Estimated proportion


```r
temp$estimate
```

```
##    p 
## 0.52
```


Pvalue for the hypothesis test $H_0: p=0.5$ versus $H_1: p \ne 0.5$


```r
temp$p.value
```

```
## [1] 0.7642
```


