# fintech-bootcamp-at-home/data
A list of datasets and/or APIs used in each project, linked to their source. For notebook plug-and-play, save the files to this folder with their referenced names.

### Project 1: Risky Business
- LoanData_Bondora.csv: https://www.kaggle.com/datasets/sid321axn/bondora-peer-to-peer-lending-loan-data
- LoanData_Bondora_updated.csv: https://www.bondora.com/en/public-reports
- LendingClub_2007_to_2018Q4/ https://www.kaggle.com/datasets/wordsforthewise/lending-club?select=accepted_2007_to_2018Q4.csv.gz (subfolder, filenames below)
    * accepted_2007_to_2018Q4.csv
    * rejected_2007_to_2018Q4.csv
- LCDataDictionary.xlsx: https://www.kaggle.com/datasets/ethon0426/lending-club-20072020q1
- Master_Loan_Summary.csv: https://www.kaggle.com/datasets/skihikingkevin/online-p2p-lending

### Project 2: Currency Predictor
- USDJPY HistoricalPrices.csv: https://www.wsj.com/market-data/quotes/fx/USDJPY/historical-prices
- CURRENCY_US_XTUP_USDJPY.csv: https://www.marketwatch.com/investing/currency/usdjpy/download-data

### Project 3: Trading Bot
- alpaca-paper.json: https://docs.alpaca.markets/docs/getting-started-with-trading-api
    * API requires free account
    * For plug-and-play, this format is expected:
        ```
        {
            "KEY" : "<your API key>",
            "SECRET" : "<your API secret>",
        }
        ```
### Project 4: Stock Predictor
- BTC-USD.csv: https://finance.yahoo.com/quote/BTC-USD/history/
- crypto-FNG.csv: https://alternative.me/crypto/fear-and-greed-index/ (public API)