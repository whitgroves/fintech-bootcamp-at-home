# API Keys
If you want to reproduce these projects, you can generate these keys at no cost:

- [Alpaca](https://alpaca.markets/) - [Project 3](../project-3-trading-bot.ipynb)

To plug and play, store each key pair as a .json file in this folder, formatted like this:

```
{
    "KEY" : "<your API key>",
    "SECRET" : "<your API secret>",
}
```

And then update this line in your script:

```
with open('./api/<your API keys>.json') as keyfile: api = json.load(keyfile)
```