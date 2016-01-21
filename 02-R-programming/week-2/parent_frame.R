#http://stackoverflow.com/questions/7439110/what-is-the-difference-between-parent-frame-and-parent-env-in-r-how-do-they

#parent frames

f = function()
  c(
    f = environment(), defined_in = parent.env(environment()),
    called_from = parent.frame()
  )
g = function()
  c(g = environment(), f())