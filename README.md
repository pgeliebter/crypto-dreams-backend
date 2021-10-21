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


#### Optional: The next step is not strictly necessary as [Shrimpy](https://developers.shrimpy.io/docs/#introduction)'s API allows calls without authorization. But their are rate limits (10 calls / minute / IP address) when there is no authorization. This is only affects the `/spreads` route.  After that we need to update the Master key in order to unlock our API key for Shrimpy.   Open the project then navigate to the `/config` folder and add a new file called `master.key` copy and paste the secret key that has been provided for this project.   After that make sure that the Shrimpy key is visible after runnings:
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


## Live Version and Front End

You can check out the front end for this project here:  
[https://github.com/pgeliebter/crypto-dreams](https://github.com/pgeliebter/crypto-dreams)

  
You can check out the hosted version of the project here:  
[https://crypto-dreams.netlify.app](https://crypto-dreams.netlify.app)  
[https://crypto-dreams-backend.heroku.com](https://crypto-dreams-backend.heroku.com)
