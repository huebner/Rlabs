################### Rcode for comparing two proportions 

# Among adults with cat bites, is the proportion of women bitten higher among patients with depression compared to without depression? 
# more often than women without depression?
# Reference: Hanauer DA, Ramakrishnan N, Seyfried LS (2013) Describing the Relationship between Cat Bites and Human Depression Using Data from an Electronic Health Record. PLoS ONE 8(8): e70585. doi:10.1371/journal.pone.0070585  University of Michigan, Ann Arbor


#  In the dataset extracted from electronic health records during a 3 year period
#  in southeastern Michigan there were 750 patients seeking medical care for cat bites. 
#  Among those 310 suffered from depression.


#  Define the data set in R
bites<-matrix(c(258, 306, 310-258, 440-306 ), 2,2)
colnames(bites)<-c("female", "male")
rownames(bites)<-c("depression", "no depression")
bites

# 2-sample test for equality of proportions with continuity correction
# sample 1 = depression, sample 2 = no depression
prop.test(bites,conf.level=0.95) 
# The results indicate that among adults with catbites, the proportion of women are higher in patients with depression than without depression.  

# Save the output 
temp<-prop.test(bites,conf.level=0.95)
# names(temp) shows us what output values are available

#confidence interval for the difference in the proportions
temp$conf.int

# sample proportions, prop1=proportion of women in sample 1 (depression), 
# prop2=proportion of women in sample 2 (no depression)
temp$estimate

# pvalue of the hypothesis test H0: p1=p2 versus H1: p1 != p2
temp$p.value

