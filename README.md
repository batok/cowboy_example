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

## Docker

If you want to run it with Docker

first build the docker image

```bash
$ docker build --tag cowboy_example:1.0 .
```

and to run it ...

```bash
$ sudo docker run --rm  --user=root --publish 8080:8080 --name cowboy_example_z cowb
oy_example:1.0
```

Maybe you need or not to run with sudo.

*  Running with kubernetes ( using k3s )

Install k3s on your system.
Build and push the Dockerfile included in this repo to your public or private docker repository or use the one that is in the yaml file.
If you want to use your own docker image from your preferred registry change the line ...

```yaml
          image: batok/cowboy-example:1.0
```

to suit your needs.

Deploy app with ....

```bash
$ sudo k3s kubectl deploy -f k3s/cowboy_example
```

To know your IP address exposed as port 80 run ...

```bash
$ sudo k3s kubectl get ingress,svc,pods -n cowboy-example
```


