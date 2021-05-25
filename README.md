# Bijou

Welcome to [Bijou!](https://www.merriam-webster.com/dictionary/bijou)
One of many URL shorteners with an interesting name 😂

## Getting started with local development
This project assumes that you're on a system with both [`make`](https://www.gnu.org/software/make/) and [`docker`](https://docs.docker.com/) installed.
The Docker version needed to get started is Docker version 20.10.X.

When pulling down the project, I recommend beginning by running `make test`.

To begin using the app locally, run `make server`. Once compilation has finished, you can visit Bijou by navigating to [http://localhost:4000/](http://localhost:4000/).

If any of the above fail, please open an issue within this repository containing both your `make` and `docker` versions.
This can be obtained by running `make -v` and `docker -v` respectively.

Thanks!
