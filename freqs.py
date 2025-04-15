import matplotlib.pyplot as plt


def x(n):
    if n < 0:
        return 0
    elif n < 3:
        return n + 1
    elif n < 5:
        return 5 - n
    else:
        return 1


def y(n):
    return 2 * x(n) - 3 * x(n - 1) + 2 * x(n - 2)


def h(n):
    match n:
        case 0 | 2:
            return 2
        case 1:
            return -3
        case _:
            return 0


ns = list(range(0, 11))
xs = [x(n) for n in ns]
ys = [y(n) for n in ns]

ns2 = list(range(-2, 5))
hs = [h(n) for n in ns2]

plt.plot(ns, xs, "o")
plt.xlabel("n", fontsize=20)
plt.ylabel("x[n]", fontsize=20)
plt.grid(True)
plt.show()

plt.plot(ns, ys, "o")
plt.xlabel("n", fontsize=20)
plt.ylabel("y[n]", fontsize=20)
plt.grid(True)
plt.show()

plt.plot(ns2, hs, "o")
plt.xlabel("n", fontsize=20)
plt.ylabel("h[n]", fontsize=20)
plt.grid(True)
plt.show()
