library("hexSticker")
library("lattice")
library("ggplot2")
library("partitions")
library("magrittr")


imgurl <- system.file("clifford_blue.png", package="clifford")
sticker(imgurl, package="clifford", p_size=8, s_x=1, s_y=.95,
s_width=1, asp=0.85, white_around_sticker=TRUE, h_fill="#5533FF",
h_color="#000000", filename="clifford.png")
