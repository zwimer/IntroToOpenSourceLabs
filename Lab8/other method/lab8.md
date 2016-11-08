#lab8

###Resulting Graphs

-[Plot Association Rules](./plot_assoc-rules.png)

-[Group Matrix](/lab8/group_mtx.png)

-[Graph](graph.png)

Parameters used: support ≥ 0.075, confidence ≥ 0.4. This confidence threshold had to be low enough to show actual trends (there would be more confident rules if there were more data, presumable) and the support threshold had to be high enough to exclude noise. One thing that might have resulted in more certain/helpful rules would be using a range for GRE scores, or rounding to a larger number; as it is, a handful of low-support rules appear associating very specific scores
with admission, but too few people get that score for this datum to be meaningful. If instead the scores were rounded to the nearest 100, more accurate rules might be easier to find. Instead, all of the rules correlate rank and admission (because there are only 4 options for rank and 2 for admission).

###Project Progress:

I'm still in the process of learning and getting comfortable with Rust, so I'm not really in a position to be adding concrete features or fixing bugs. I reviewed more of the codebase, which also helps me with the language familiarity.
