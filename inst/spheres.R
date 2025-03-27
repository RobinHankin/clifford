library("clifford")
options("maxdim" = 5)  # paranoid safety measure
signature(4,1)
eplus <- basis(4)
eminus <- basis(5)

e0 <-  (eminus - eplus)/2
einf <- eminus + eplus
E <- e0 ^ einf

point <- function(x){ as.1vector(x) + sum(x^2)*einf/2 + e0 }

# "u_foo" means "unknown foo"
u_c <- c(3, -5, 6)
u_r <- 31

sphere <- function(center, radius, vec){
    point(center + radius*vec/sqrt(sum(vec^2)))
}

p01 <- sphere(u_c, u_r, c(1,4,2))
p02 <- sphere(u_c, u_r, c(6,-5,3))
p03 <- sphere(u_c, u_r, c(0,4,0))
p04 <- sphere(u_c, u_r, c(1,0,0))

S <- p01 ^ p02 ^ p03 ^ p04 / pseudoscalar()            
radius <- sqrt(drop((S / drop(S %.% einf))^2))


S_sand <- S * einf * S                  #sandwich product

scaling_factor <- -zap(S_sand %.% (e(4) + e(5)))

center_cartesian <- getcoeffs(zap(S_sand / scaling_factor), 1:3)
print(center_cartesian)
print(radius)


"
Solve[{
    (x-x2)^2 + (y-y2)^2 + (z-z2)^2 == (x-x1)^2 + (y-y1)^2 + (z-z1)^2,
    (x-x3)^2 + (y-y3)^2 + (z-z3)^2 == (x-x1)^2 + (y-y1)^2 + (z-z1)^2,
    (x-x4)^2 + (y-y4)^2 + (z-z4)^2 == (x-x1)^2 + (y-y1)^2 + (z-z1)^2
},{
    x,y,z
}]
"
