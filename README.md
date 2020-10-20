# SalesLoft Engineering Enablement Exercise

SalesLoft is looking to add weather information to our app. Why? I dunno, Product Management is weird. 

Anyways, we need to set up a small proxy service so that we can abstract away the provider we use behind the scenes. Engineering Enablement is kicking off this project so we can get all the plumbing hooked up and good to go for development to add caching, service load balancing, and other complex things. 

They will need:
- The initial API
- A basic test suite
- CI to be setup
- A Docker-ized application
- Deployment files for Kubernetes

## What You Get

[Phoenix](https://phoenixframework.org/) has been set up and is available to run the application server. Ecto has been disabled, as you won't need a database for this service. The frontend assets have also been disabled, but feel free to build a pretty GUI if you have heaps of free time.

[ExUnit](https://hexdocs.pm/ex_unit/) is also set up with some scaffolding in place. You must fill this in with your own tests.

[Envy](https://github.com/BlakeWilliams/envy) is set up and the `.env` file is gitignored so you can use configuration secrets safely.

No HTTP client is provided, but we like using [HTTPoison](https://github.com/edgurgel/httpoison).

## Expected API

Your mission, if you choose to accept it, is to get weather information from ~~[Dark Sky's API](https://darksky.net/dev)~~ (The Dark Sky API is no longer public. Please choose [an alternative](https://hackernoon.com/8-weather-api-alternatives-now-that-darksky-is-shutting-down-j8gs302e) and mention why you ended up using the option you chose.) and present it as an HTTP API. You will need to get your own API key from Dark Sky, but they are free. **Please don't commit your API key into the repository or publish it to a Docker registry!**

`/weather?latitude&longitude` is the expected input for a location (e.g., `/weather?latitude=33.7984&longitude=-84.3883`). 

It should return JSON with the current weather and 7 day forecast. The response looks like this:
```json
{
  "date": "2018-01-23",
  "type": "partly-cloudy-day",
  "description": "Partly Cloudy",
  "temperature": 61.78,
  "wind": {
    "speed": 4.66,
    "bearing": 147
  },
  "precip_prob": 0,
  "daily": [
    {
      "date": "2018-01-23",
      "type": "partly-cloudy-day",
      "description": "Mostly cloudy throughout the day.",
      "temperature": {
        "low": 46.78,
        "high": 68.66
      }
    },
    ...
  ]
}
```

## CI and Deployment

You may use any CI system you like. We use Github Actions at SalesLoft, but it is not required.

For deployment, we use Kubernetes, so the app will need to run within a Docker container. We don't need to have the container image available publicly.

If you don't have a Kubernetes cluster available, you can run one locally with [Minikube](https://kubernetes.io/docs/setup/minikube/) or remotely with [Katacode](https://www.katacoda.com/courses/kubernetes/playground) or [Play with Kubernetes](https://labs.play-with-k8s.com/).

In the end, you should be able to push to Github and have the test suite run. And we should be able to add the Kubernetes resources to a cluster and be able to access the API. 

