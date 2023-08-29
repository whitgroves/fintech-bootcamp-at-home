# fintech-bootcamp-at-home
I wanted to attend [the edX fintech bootcamp](https://www.edx.org/boot-camps/fintech) in February 2023, but the price was too damn high. While researching financing options, I found [their course overview](./Rice%20Fintech%20Bootcamp%20Curriculum%20Overview%202020-2021.pdf) on LinkedIn. I figured I could backfill the modules with online resources to create my own study reference, then work through the projects to learn the material and test my understanding. This is the result.

The notebooks are my proof-of-work for each project. They're all written in [Python 3.11](https://www.python.org/downloads/) or [3.10 (Miniconda)](https://docs.conda.io/en/latest/miniconda-other-installer-links.html), and use [these datasets](./data/README.md). 

Since this was driven out of personal curiosity, it only covers areas I'm interested in and didn't already feel comfortable with. Anyone looking to use this study guide should tailor it to your own background knowledge and learning goals. If you're looking to get industry ready on a budget, consider something like the [OSDSM](https://github.com/datasciencemasters/go#the-open-source-data-science-masters).

## Module 1: Intro to Fintech
Primer for financial concepts used throughout the course, plus some context on the industry. 

### Fintech Landscape
- Deloitte case studies: https://www2.deloitte.com/us/en/pages/finance-transformation/articles/finance-digital-transformation-case-studies.html
- 2013 *Nature* paper on data-driven trading: https://www.nature.com/articles/srep01684

### Financial Ratios
- Intro to financial ratio analysis: https://www.investopedia.com/terms/r/ratioanalysis.asp
- Investopedia hub: https://www.investopedia.com/financial-ratios-4689817

### Project 1: [Risky Business](./project-1-risky-business.ipynb)
*Note: This is placed a bit early, but I wanted to close the module with a deep dive into the programming side to find which technical areas I need to focus on.*

## Module 2: Financial Programming
Learn about the Python libraries used in fintech and how to use them.

### Pandas
- Kaggle course: https://www.kaggle.com/learn/pandas
- Searchable recipes: https://www.skytowner.com/explore/pandas_recipes_reference
- Exercise drills: https://github.com/guipsamora/pandas_exercises 
- Community tutorials: https://pandas.pydata.org/pandas-docs/stable/getting_started/tutorials.html

### Data Visualization
- Kaggle course: https://www.kaggle.com/learn/data-visualization
- Matplotlib deep dive: https://nbviewer.org/github/matplotlib/AnatomyOfMatplotlib/tree/master/
- Export charts to Excel: https://pandas-xlsxwriter-charts.readthedocs.io/
- PyViz tutorials: https://pyviz.org/tutorials/index.html

### SciPy
- Intro tutorial: https://www.w3schools.com/python/scipy/index.php
- User guide: https://docs.scipy.org/doc/scipy/tutorial/index.html
- Deep dive: https://scipy-lectures.org/

### Scikit-learn
- Official tutorials: https://scikit-learn.org/stable/tutorial/index.html

### Project 2: [Currency Predictor](./project-2-currency-predictor.ipynb)

## Module 3: Machine Learning
Learn how to make algorithmic trading bots and price prediction neural nets.

### Machine Learning
- Kaggle course (beginner): https://www.kaggle.com/learn/intro-to-machine-learning
- Kaggle course (intermediate): https://www.kaggle.com/learn/intermediate-machine-learning
- Google foundational courses: https://developers.google.com/machine-learning/foundational-courses
- Google guides: https://developers.google.com/machine-learning/guides
- Google case studies: https://pair.withgoogle.com/guidebook/case-studies

### Financial Modeling
- Primer: https://www.investopedia.com/terms/f/financialmodeling.asp
- Coursera x Wharton: https://www.coursera.org/specializations/wharton-business-financial-modeling
- Coursera x Columbia: https://www.coursera.org/specializations/financialengineering

### Project 3: [Trading Bot](./project-3-trading-bot.ipynb)

### Neural Networks
- Kaggle course: https://www.kaggle.com/learn/computer-vision
- Google advanced courses: https://developers.google.com/machine-learning/advanced-courses

### Time Series Forecasting
- Kaggle course: https://www.kaggle.com/learn/time-series
- More tutorials: https://machinelearningmastery.com/start-here/#timeseries

### Project 4: [Stock Predictor](./project-4-stock-predictor.ipynb)

## Module 4: Blockchain and Cryptocurrency
*"Hey, Bitcoin's up again!"*

### Crypto Ecosystems
- BTC whitepaper: https://bitcoin.org/bitcoin.pdf
- ETH voting contract tutorial: https://medium.com/buildbear/a-step-by-step-guide-to-building-and-deploying-a-voting-smart-contract-on-the-blockchain-468665034c9e

### Project 5: Profit Splitter