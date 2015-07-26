
pv <- 250000    # inital loan value
n  <- 20 * 12   # number of periods 20 years, monthly payments
r  <- 4.5 / 100 / 12  # rate per period

# Payment per period
p <- (r * pv) / ( 1 - (1 + r)^-n)

period <- 0:n
balance <- pv - 0:n * p

plot(period,balance,type="n")
lines(period,balance)



