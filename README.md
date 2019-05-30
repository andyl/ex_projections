# ExProjections

Elixir's umbrella structure doesn't work out-of-the-box with
`vim-projectionist`.  The problem is that `vim-projectionist` allows one
wildcard expression in the path, and umbrella apps require two.

The workaround is to put a custom-generated file `.projections.json` into the
root directory of your elixir project.  This will provide quick navigation
between source files and their corresponding tests, even for umbrella projects.

This library simply writes a custom `.projections.json` file to your local
directory.  

The `.projections.json` file will be read by `vim-projectionist`, and
also by the projectionist plugins for `vscode`, `atom` and probably other
editors.  

## Use as an Escript

First, clone the repo locally:

    git clone https://github.com/andyl/ex_projections

Then install the escript:

    cd ex_projections
    mix deps.get
    mix compile
    mix escript.install --force

Once installed, you can run the escript:

    cd <yourproject>
    ex_projections

## Use as a Mix Task

The package can be installed by adding `ex_projections` to your list of
dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_projections, git: "https://github.com/andyl/ex_projections"}
  ]
end
```

Once this is done, you can run the mix task:

    mix ex_projections

## Related Projects

- [tpope/vim-projectionist][lnk1]
- [andyl/vim-projectionist-elixir][lnk2]

[lnk1]: https://github.com/tpope/vim-projectionist
[lnk2]: https://github.com/andyl/vim-projectionist-elixir

