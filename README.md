# README

### Lab requirements

  1. Install git
     - Windows: Install via http://git-scm.com
     - OS X: Install with package manager or http://git-scm.com
     - Linux: Install via distribution package manager or http://git-scm.com

  2. Install Erlang & Elixir
     - See http://elixir-lang.org/install.html

##### Verify your installations

Verify your installation by calling the executables `git`, `erl` and `iex` in
your shell. Your erlang installation needs to be on OTP 17 and Elixir on 1.0.0
or higher. Check the version by running `iex`:

```
~ λ iex
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (1.1.0-dev) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```


### Installing a lab

The repository for all labs is found at https://github.com/ericmj/workshop.

  1. git clone from your console

        $ git clone git@github.com:ericmj/workshop.git

  2. Enter the workshop directory

        $ cd workshop

  2. Check out the current lab named labN

        $ git checkout labN


### Lab links

The individual labs can be found at the following URLs:

Elixir basics: https://github.com/ericmj/workshop/tree/lab1

Implement a chat: https://github.com/ericmj/workshop/tree/lab2

Using ShouldI: https://github.com/ericmj/workshop/tree/lab3

Using Blacksmith: https://github.com/ericmj/workshop/tree/lab4
