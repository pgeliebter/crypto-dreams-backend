# Crypto Dreams Backend

## Welcome

Thanks for checking out my project, I hope you enjoy!  
This was built using Ruby on Rails

-Pinny Geliebter

## Build Setup

General info:  
Ruby version = 3.0.1  
Rails version = 6.1.4.1

First, you need to clone the repo down to your local machine.  
Go to the directory where this will be installed and:
```bash
git clone https://github.com/pgeliebter/crypto-dreams-backend.git
cd crypto-dreams-backend
```


Next, you need to install gems by doing:
```bash
bundle install
```


Optional: The next step is not strictly necessary as [Shrimpy](https://developers.shrimpy.io/docs/#introduction)'s API allows calls without authorization. But their are rate limits (10 calls / minute / IP address) when there is no authorization. This is only affects the `/spreads` route.
#### Next we need to update the Master Key. Open the project then navigate to the `/config` folder and add a new file called `master.key` copy and paste the secret key that has been provided for this project.   After that make sure that the Shrimpy key is visible after running:
```bash
rails credentials:edit
```


Next step is to create the Postgres database:
```bash
rails db:create
```


Lastly, in order to run our server:
```bash
rails s
```

## Routes

```
/spreads
```
This route returns data from the Shrimpy Developers API that contains bid and ask info for available exchanges.  Accepts query_params of `base=` and `quote=` for the base and quote symbol.  Example `/spreads?base=BTC&quote=USD`

```
/prices/market_chart
/prices/current_price
```
These routes return data from CoinGecko with the past 7 day price history and current price respectively for Bitcoin.


## Live Version and Front End

You can check out the front end for this project here:  
[https://github.com/pgeliebter/crypto-dreams](https://github.com/pgeliebter/crypto-dreams)

  
You can check out the hosted version of the project here:  
[https://crypto-dreams.netlify.app](https://crypto-dreams.netlify.app)
