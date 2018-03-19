# RedMonk Language Rankings Bump Chart Code

A simple r-lang script to generate a "bump chart" visualisation of the RedMonk Language Rankings over time.

The latest language rankings, as of March 2018, are at [The RedMonk Programming Language Rankings: January 2018](https://redmonk.com/sogrady/2018/03/07/language-rankings-1-18/).
The graph from this script is viewable at [RedMonk Language Rankings Over Time](https://redmonk.com/fryan/2018/03/15/redmonk-language-rankings-over-time/).

## Bump Charts

I had seen bump charts in some of [Edward Tufftes work](https://www.edwardtufte.com/bboard/q-and-a-fetch-msg?msg_id=0003nk) - whey they are generally referred to 
as slopegraphs, but when thinking about representing this data I turned to the excellent [Data Visualisation](https://www.amazon.co.uk/Data-Visualisation-Andy-Kirk/dp/1473912148/ref=sr_1_1
) from [Andy Kirk](https://twitter.com/visualisingdata). 

Some quick searching for bump charts and ggplot pointed me to this lovely graph and code on [college rankings](http://data-slinky.com/project/3_College_rankings/) from [John K. Nguyen](https://twitter.com/dataslinky),
from which this script is derived. The heavy lifting was already done. 

