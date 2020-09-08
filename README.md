# CowboyExample

**Shows to how to do a helloworld Elixir program based on cowboy ( no plug , just cowboy )**

## Installation

```bash
$ mix deps.get
$ mix run --no-halt
```

This runs a webserver running at port 8080

![Screen Shot 2020-06-12 at 10 48 40](https://user-images.githubusercontent.com/29124/84521250-56d59380-ac9a-11ea-8dc8-7d1051bad11c.png)

To verify that it's working, from another terminal session do...

```bash
$ curl localhost:8080
```

To use unix sockets intead of a tcp port start with

```bash
$ USE_UNIX_SOCKETS=1 mix run --no-halt
```

and to test it with curl, from another terminal session do

```bash
$ curl --unix-socket cowboy_example.sock localhost
```

