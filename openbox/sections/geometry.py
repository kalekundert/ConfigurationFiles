# Screen and Geometry Data
screen_width = 1680
screen_height = 1050

sakura_rows = 21
sakura_columns = 79

x = division_width = 648
y = division_height = 390
z = 2 * division_width

onyx = { "top" : 22, "bottom" : 2, "sides" : 2 }
clearlooks  = { "top" : 20, "bottom" : 5, "sides" : 2 }

vertical_padding = onyx["top"] + onyx["bottom"]
horizontal_padding = 2 * onyx["sides"]

normal_width = division_width - horizontal_padding
full_width = screen_width - horizontal_padding

expanded_width = full_width - division_width
contracted_width = expanded_width - division_width

top_height = division_height - vertical_padding
full_height = screen_height - vertical_padding
bottom_height = full_height - division_height


