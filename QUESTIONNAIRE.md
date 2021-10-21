## Questionnaire
 - Are there any sub-optimal choices( or short cuts taken due to limited time ) in your implementation?
	 -  In the beginning of this project I started by writing different calls to different exchanges’ APIs. As I did more discovery, I encountered the Shrimpy Dev API  [https://developers.shrimpy.io/](https://developers.shrimpy.io/). I decided to use that as it would open the door to a lot more exchanges. If this were a full build out for an actual service I would build out API clients for each exchange that is supported. 
	 Also, with more time I focus on compartmentalizing my code more into more reusable components than I have created.
<br>
 - Is any part of it over-designed? ( It is fine to over-design to showcase your skills as long as you are clear about it)
	 - The UI - I put a very heavy emphasis on the UI. As an end user myself, I know how important an intuitive UX is. 
	 - The ability to select cryptos and quote currency.
	 - I added another page `/prices` to pull in current pricing info and market history.
<br>
 - If you have to scale your solution to 100 users/second traffic what changes would you make, if any?
	 - There are two main changes to the backend that would need to be implemented:
		 - Caching - There would be a need to cache responses from any 3rd party API calls. This would improve speed to our front end and limit API calls to 3rd parties. Even if the cache lasted for a few seconds in order to make sure market data is current, it would be well worth it.
		 - Concurrence - After building out separate clients for each exchange it would be important to run all those calls concurrently so there won't be a delay between each call.
<br>
 - What are some other enhancements you would have made, if you had more time to do this implementation?
	 - Error handling for external APIs. So that includes retrying calls, error logging for failed call, and showing errors in the front end as well.
	 - I would love to show the user a list of base and quote symbols to choose from that would be loaded from an external API. I would love to add more pages with more granular choices for looking at other pieces of information.
	 - And adding the ability for a user to login and save some assets to watch for their own customized dashboard.


Thanks again,
Pinny Geliebter