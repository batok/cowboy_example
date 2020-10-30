FROM bitwalker/alpine-elixir:latest

# Set exposed ports
EXPOSE 8080
ENV PORT=8080

ENV MIX_ENV=prod

COPY . .
RUN mix deps.get
RUN mix release


USER default

CMD ["./_build/prod/rel/cowboy_example/bin/cowboy_example",  "start"]
