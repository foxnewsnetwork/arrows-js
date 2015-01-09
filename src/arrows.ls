# Arrows always maintain the context of wherever they were called
class Arrows
  _compose = (f, g) -> 
    new Arrows (x) ->
      x |> f |> g

  _fmap = (f,g) ->
    new Arrows (x) ->
      x |> f |> ( .map g )
  
  @lift = (thing) ->
    switch typeof thing
    case "function"
      new Arrows thing
    else
      new Arrows -> thing


  (@func) ->

  compose: (g) -> Arrows.compose @, Arrows.lift(g)

  fmap: (g) -> Arrows.fmap @, Arrows.lift(g)

  run: (x) -> @func x

module.exports = Arrows