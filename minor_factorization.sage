# Authors: Matt Larson, Shiyue Li

import itertools

N = 15 # a big number 
R = PolynomialRing(QQ, N, 'x')
gen_list = list(R.gens())
gen_string = [str(i) for i in R.gens()]
gens = [var(gen_string[i]) for i in range(1, len(gen_list))]

# Cerberus
s41 = [[x1, x2, x3, x4]]

s51 = [[x1, x2, x3, x4], [x1, x2, x3, x5]] 

# n = 6
s61 = [[x1, x2, x3, x4], [x1, x2, x5, x6], [x3, x4, x5, x6]] 
#-(x1*x2*x3 + x1*x2*x4 - x1*x3*x4 - x2*x3*x4 - x1*x2*x5 + x3*x4*x5 - x1*x2*x6 + x3*x4*x6 + x1*x5*x6 + x2*x5*x6 - x3*x5*x6 - x4*x5*x6)*(x1 - x2)*(x3 - x4)*(x5 - x6)
#deg = 2
# (2, (x1*x2*x3 + x1*x2*x4 - x1*x3*x4 - x2*x3*x4 - x1*x2*x5 + x3*x4*x5 - x1*x2*x6 + x3*x4*x6 + x1*x5*x6 + x2*x5*x6 - x3*x5*x6 - x4*x5*x6)*(x1 - x2)*(x3 - x4)*(x5 - x6))
# (2, -(x1*x2*x3 + x1*x2*x4 - x1*x3*x4 - x2*x3*x4 - x1*x2*x5 + x3*x4*x5 - x1*x2*x6 + x3*x4*x6 + x1*x5*x6 + x2*x5*x6 - x3*x5*x6 - x4*x5*x6)*(x1 - x2)*(x3 - x4)*(x5 - x6))
# (2, (x1*x2*x3 + x1*x2*x4 - x1*x3*x4 - x2*x3*x4 - x1*x2*x5 + x3*x4*x5 - x1*x2*x6 + x3*x4*x6 + x1*x5*x6 + x2*x5*x6 - x3*x5*x6 - x4*x5*x6)*(x1 - x2)*(x3 - x4)*(x5 - x6))
# -(x1*x2*x3 + x1*x2*x4 - x1*x3*x4 - x2*x3*x4 - x1*x2*x5 + x3*x4*x5 - x1*x2*x6 + x3*x4*x6 + x1*x5*x6 + x2*x5*x6 - x3*x5*x6 - x4*x5*x6)*(x1 - x2)*(x3 - x4)*(x5 - x6)

s62 = [[x1, x2, x3, x4], [x1, x2, x3, x5], [x1, x2, x3, x6]] 
# gcd: (x1 - x2)^2*(x1 - x3)^2*(x2 - x3)^2
#deg = 1
# (1, (x1 - x2)*(x1 - x3)*(x2 - x3))
# (1, (x1 - x2)*(x1 - x3)*(x2 - x3))
# (1, (x1 - x2)*(x1 - x3)*(x2 - x3))
# (2, (x1 - x2)^2*(x1 - x3)^2*(x2 - x3)^2)
# (2, (x1 - x2)^2*(x1 - x3)^2*(x2 - x3)^2)
# (2, (x1 - x2)^2*(x1 - x3)^2*(x2 - x3)^2)

s63 = [[x1, x2, x3, x4], [x1, x2, x5, x6], [x1, x2, x3, x5]] 
# gcd: (x1 - x2)^2*(x1 - x3)*(x1 - x5)*(x2 - x3)*(x2 - x5)
#deg = 1

s64 = [[x1, x2, x3, x4], [x1, x2, x5, x6], [x2, x3, x4, x5]]
# gcd: (x1 - x2)*(x1 - x5)*(x2 - x3)*(x2 - x4)*(x2 - x5)*(x3 - x4)
#deg = 1



# n = 7
s71 = [[x1, x2, x6, x7], [x4, x5, x6, x7], [x1, x2, x3, x5], [x1, x2, x3, x4]] 
#-(x1*x2*x4 + x1*x2*x5 - x1*x4*x5 - x2*x4*x5 - x1*x2*x6 + x4*x5*x6 - x1*x2*x7 + x4*x5*x7 + x1*x6*x7 + x2*x6*x7 - x4*x6*x7 - x5*x6*x7)*(x1 - x2)^2*(x1 - x3)*(x2 - x3)*(x4 - x5)*(x6 - x7)
#deg = 2
# (1, (x1 - x2)*(x1 - x3)*(x2 - x3))
# (1, (x1 - x2)*(x1 - x3)*(x2 - x3))
# (2, (x1*x2*x4 + x1*x2*x5 - x1*x4*x5 - x2*x4*x5 - x1*x2*x6 + x4*x5*x6 - x1*x2*x7 + x4*x5*x7 + x1*x6*x7 + x2*x6*x7 - x4*x6*x7 - x5*x6*x7)*(x1 - x2)*(x4 - x5)*(x6 - x7))
# (3, (x1*x2*x4 + x1*x2*x5 - x1*x4*x5 - x2*x4*x5 - x1*x2*x6 + x4*x5*x6 - x1*x2*x7 + x4*x5*x7 + x1*x6*x7 + x2*x6*x7 - x4*x6*x7 - x5*x6*x7)*(x1 - x2)^2*(x1 - x3)*(x2 - x3)*(x4 - x5)*(x6 - x7))
# (3, (x1*x2*x4 + x1*x2*x5 - x1*x4*x5 - x2*x4*x5 - x1*x2*x6 + x4*x5*x6 - x1*x2*x7 + x4*x5*x7 + x1*x6*x7 + x2*x6*x7 - x4*x6*x7 - x5*x6*x7)*(x1 - x2)^2*(x1 - x3)*(x2 - x3)*(x4 - x5)*(x6 - x7))
# (3, (x1*x2*x4 + x1*x2*x5 - x1*x4*x5 - x2*x4*x5 - x1*x2*x6 + x4*x5*x6 - x1*x2*x7 + x4*x5*x7 + x1*x6*x7 + x2*x6*x7 - x4*x6*x7 - x5*x6*x7)*(x1 - x2)^2*(x1 - x3)*(x2 - x3)*(x4 - x5)*(x6 - x7))
# (3, -(x1*x2*x4 + x1*x2*x5 - x1*x4*x5 - x2*x4*x5 - x1*x2*x6 + x4*x5*x6 - x1*x2*x7 + x4*x5*x7 + x1*x6*x7 + x2*x6*x7 - x4*x6*x7 - x5*x6*x7)*(x1 - x2)^2*(x1 - x3)*(x2 - x3)*(x4 - x5)*(x6 - x7))
# -(x1*x2*x4 + x1*x2*x5 - x1*x4*x5 - x2*x4*x5 - x1*x2*x6 + x4*x5*x6 - x1*x2*x7 + x4*x5*x7 + x1*x6*x7 + x2*x6*x7 - x4*x6*x7 - x5*x6*x7)*(x1 - x2)^2*(x1 - x3)*(x2 - x3)*(x4 - x5)*(x6 - x7)

s72 = [[x1, x2, x3, x4], [x1, x2, x3, x5], [x1, x4, x5, x7], [x2, x3, x4, x6]] 
# gcd: (x1 - x2)*(x1 - x3)*(x1 - x4)*(x1 - x5)*(x2 - x3)^2*(x2 - x4)*(x3 - x4)*(x4 - x5)
#deg  = 1
# (1, (x1 - x2)*(x1 - x3)*(x2 - x3))
# (1, (x1 - x5)*(x1 - x6)*(x5 - x6))
# (1, -(x2 - x3)*(x2 - x5)*(x3 - x5))
# (1, (x1 - x3)*(x1 - x5)*(x3 - x5))
# (1, -(x1 - x2)*(x1 - x5)*(x2 - x5))
# (1, (x1 - x2)*(x1 - x3)*(x2 - x3))
# (1, -(x2 - x3)*(x2 - x5)*(x3 - x5))
# (2, (x1 - x2)*(x1 - x3)*(x1 - x5)*(x1 - x6)*(x2 - x3)*(x5 - x6))
# (2, (x1 - x2)*(x1 - x3)*(x2 - x3)^2*(x2 - x5)*(x3 - x5))
# (2, -(x1 - x2)*(x1 - x3)*(x1 - x5)*(x1 - x6)*(x2 - x3)*(x5 - x6))
# (2, (x1 - x2)*(x1 - x3)*(x2 - x3)^2*(x2 - x5)*(x3 - x5))
# (2, (x1 - x5)*(x1 - x6)*(x2 - x3)*(x2 - x5)*(x3 - x5)*(x5 - x6))
# (2, -(x1 - x2)*(x1 - x3)*(x1 - x5)*(x1 - x6)*(x2 - x3)*(x5 - x6))
# (2, (x1 - x5)*(x1 - x6)*(x2 - x3)*(x2 - x5)*(x3 - x5)*(x5 - x6))
# (2, (x1 - x2)*(x1 - x3)*(x2 - x3)^2*(x2 - x5)*(x3 - x5))
# (3, -(x1 - x2)*(x1 - x3)*(x1 - x5)*(x1 - x6)*(x2 - x3)^2*(x2 - x5)*(x3 - x5)*(x5 - x6))
# (3, -(x1 - x2)*(x1 - x3)*(x1 - x5)*(x1 - x6)*(x2 - x3)^2*(x2 - x5)*(x3 - x5)*(x5 - x6))
# (3, (x1 - x2)*(x1 - x3)*(x1 - x5)*(x1 - x6)*(x2 - x3)^2*(x2 - x5)*(x3 - x5)*(x5 - x6))
# (3, (x1 - x2)*(x1 - x3)*(x1 - x5)*(x1 - x6)*(x2 - x3)^2*(x2 - x5)*(x3 - x5)*(x5 - x6))
# (x1 - x2)*(x1 - x3)*(x1 - x5)*(x1 - x6)*(x2 - x3)^2*(x2 - x5)*(x3 - x5)*(x5 - x6)

s73 = [[x1, x2, x3, x4], [x1, x2, x3, x5], [x1, x2, x3, x6], [x1, x2, x3, x7]]
#gcd: (x1 - x2)^3*(x1 - x3)^3*(x2 - x3)^3
#deg = 1

s74 = [[x1, x2, x3, x4], [x1, x2, x5, x6], [x3, x4, x5, x6], [x1, x3, x5, x7]]
#-(x1*x2*x3 + x1*x2*x4 - x1*x3*x4 - x2*x3*x4 - x1*x2*x5 + x3*x4*x5 - x1*x2*x6 + x3*x4*x6 + x1*x5*x6 + x2*x5*x6 - x3*x5*x6 - x4*x5*x6)*(x1 - x2)*(x1 - x3)*(x1 - x5)*(x3 - x4)*(x3 - x5)*(x5 - x6)
#deg = 2

s75 = [[x1, x2, x3, x4], [x1, x2, x3, x5], [x1, x5, x6, x7], [x2, x5, x6, x7]]
#gcd: -(x1 - x2)^2*(x1 - x3)*(x1 - x5)*(x2 - x3)*(x2 - x5)*(x5 - x6)*(x5 - x7)*(x6 - x7)
#deg = 1


# n = 8
s81 = [[x1, x2, x3, x4], [x1, x2, x3, x5], [x1, x2, x6, x7], [x3, x4, x7, x8], [x5, x6, x7, x8]]
# gcd: (x1*x2*x3*x5^2 + x1*x2*x4*x5^2 - x1*x3*x4*x5^2 - x2*x3*x4*x5^2 + x1*x2*x3*x4*x6 - x1*x2*x3*x5*x6 - x1*x2*x4*x5*x6 + x3*x4*x5^2*x6 - x1*x2*x3*x5*x7 - x1*x2*x4*x5*x7 + x1*x3*x4*x5*x7 + x2*x3*x4*x5*x7 - x1*x2*x5^2*x7 + x3*x4*x5^2*x7 - x1*x3*x4*x6*x7 - x2*x3*x4*x6*x7 + x1*x2*x5*x6*x7 + x1*x3*x5*x6*x7 + x2*x3*x5*x6*x7 + x1*x4*x5*x6*x7 + x2*x4*x5*x6*x7 - x3*x4*x5*x6*x7 - x3*x5^2*x6*x7 - x4*x5^2*x6*x7 + x1*x2*x5*x7^2 - x3*x4*x5*x7^2 + x3*x4*x6*x7^2 - x1*x5*x6*x7^2 - x2*x5*x6*x7^2 + x5^2*x6*x7^2 - x1*x2*x3*x4*x8 + x1*x3*x4*x5*x8 + x2*x3*x4*x5*x8 - x1*x2*x5^2*x8 + x1*x2*x5*x6*x8 - x3*x4*x5*x6*x8 + x1*x2*x3*x7*x8 + x1*x2*x4*x7*x8 + x1*x2*x5*x7*x8 - x1*x3*x5*x7*x8 - x2*x3*x5*x7*x8 - x1*x4*x5*x7*x8 - x2*x4*x5*x7*x8 - x3*x4*x5*x7*x8 + x1*x5^2*x7*x8 + x2*x5^2*x7*x8 - x1*x2*x6*x7*x8 + x3*x4*x6*x7*x8 - x1*x5*x6*x7*x8 - x2*x5*x6*x7*x8 + x3*x5*x6*x7*x8 + x4*x5*x6*x7*x8 - x1*x2*x7^2*x8 + x3*x5*x7^2*x8 + x4*x5*x7^2*x8 - x5^2*x7^2*x8 + x1*x6*x7^2*x8 + x2*x6*x7^2*x8 - x3*x6*x7^2*x8 - x4*x6*x7^2*x8)*(x1 - x2)^2*(x1 - x3)*(x2 - x3)*(x3 - x4)*(x6 - x7)*(x7 - x8)
#deg = 3

s82 = [[x1, x2, x3, x4], [x1, x2, x3, x5], [x1, x3, x5, x6], [x1, x4, x5, x8], [x2, x5, x6, x7]]
# gcd : -(x1 - x2)*(x1 - x3)^2*(x1 - x4)*(x1 - x5)^2*(x2 - x3)*(x2 - x5)*(x2 - x6)*(x3 - x5)*(x4 - x5)*(x5 - x6)
#deg = 1

s83 = [[x1, x2, x3, x4], [x1, x2, x3, x5], [x1, x2, x3, x6], [x1, x2, x3, x7], [x1, x2, x3, x8]]
#gcd : (x1 - x2)^4*(x1 - x3)^4*(x2 - x3)^4
#deg = 1

s84 = [[x1, x2, x3, x4], [x1, x2, x5, x6], [x3, x4, x5, x6], [x1, x2, x7, x8], [x5, x6, x7, x8]]
#(x1*x2*x3 + x1*x2*x4 - x1*x3*x4 - x2*x3*x4 - x1*x2*x5 + x3*x4*x5 - x1*x2*x6 + x3*x4*x6 + x1*x5*x6 + x2*x5*x6 - x3*x5*x6 - x4*x5*x6)*(x1*x2*x5 + x1*x2*x6 - x1*x5*x6 - x2*x5*x6 - x1*x2*x7 + x5*x6*x7 - x1*x2*x8 + x5*x6*x8 + x1*x7*x8 + x2*x7*x8 - x5*x7*x8 - x6*x7*x8)*(x1 - x2)^2*(x3 - x4)*(x5 - x6)^2*(x7 - x8)
#deg = 4
#note the two irreducible factors

s85 = [[x1, x2, x3, x4], [x1, x2, x5, x6], [x3, x4, x5, x6], [x1, x3, x5, x7], [x2, x4, x6, x8]]
#gcd = -(x1*x2*x3 + x1*x2*x4 - x1*x3*x4 - x2*x3*x4 - x1*x2*x5 + x3*x4*x5 - x1*x2*x6 + x3*x4*x6 + x1*x5*x6 + x2*x5*x6 - x3*x5*x6 - x4*x5*x6)*(x1 - x2)*(x1 - x3)*(x1 - x5)*(x2 - x4)*(x2 - x6)*(x3 - x4)*(x3 - x5)*(x4 - x6)*(x5 - x6)
#deg = 2

s86 = [[x1, x2, x3, x4], [x1, x2, x5, x6], [x3, x4, x5, x6], [x1, x5, x7, x8], [x2, x3, x7, x8]]
#(x1*x2*x3 + x1*x2*x4 - x1*x3*x4 - x2*x3*x4 - x1*x2*x5 + x3*x4*x5 - x1*x2*x6 + x3*x4*x6 + x1*x5*x6 + x2*x5*x6 - x3*x5*x6 - x4*x5*x6)*(x1*x2*x3 - x1*x2*x5 - x1*x3*x5 + x2*x3*x5 - x2*x3*x7 + x1*x5*x7 - x2*x3*x8 + x1*x5*x8 - x1*x7*x8 + x2*x7*x8 + x3*x7*x8 - x5*x7*x8)*(x1 - x2)*(x1 - x5)*(x2 - x3)*(x3 - x4)*(x5 - x6)*(x7 - x8)
#deg = 4

s87 = [[x1, x2, x3, x4], [x1, x2, x5, x6], [x3, x4, x5, x6], [x1, x5, x7, x8], [x2, x6, x7, x8]]
#(x1*x2*x3 + x1*x2*x4 - x1*x3*x4 - x2*x3*x4 - x1*x2*x5 + x3*x4*x5 - x1*x2*x6 + x3*x4*x6 + x1*x5*x6 + x2*x5*x6 - x3*x5*x6 - x4*x5*x6)*(x1*x2*x5 - x1*x2*x6 + x1*x5*x6 - x2*x5*x6 - x1*x5*x7 + x2*x6*x7 - x1*x5*x8 + x2*x6*x8 + x1*x7*x8 - x2*x7*x8 + x5*x7*x8 - x6*x7*x8)*(x1 - x2)*(x1 - x5)*(x2 - x6)*(x3 - x4)*(x5 - x6)*(x7 - x8)
#deg = 4
#probably the same at s86

s88 = [[x1, x2, x3, x4], [x1, x5, x6, x7], [x1, x2, x5, x8], [x1, x3, x6, x8], [x1, x4, x7, x8]]
#gcd = (x2*x4*x5*x6 - x3*x4*x5*x6 - x2*x3*x5*x7 + x3*x4*x5*x7 + x2*x3*x6*x7 - x2*x4*x6*x7 + x2*x3*x5*x8 - x2*x4*x5*x8 - x2*x3*x6*x8 + x3*x4*x6*x8 - x2*x5*x6*x8 + x3*x5*x6*x8 + x2*x4*x7*x8 - x3*x4*x7*x8 + x2*x5*x7*x8 - x4*x5*x7*x8 - x3*x6*x7*x8 + x4*x6*x7*x8 - x3*x5*x8^2 + x4*x5*x8^2 + x2*x6*x8^2 - x4*x6*x8^2 - x2*x7*x8^2 + x3*x7*x8^2)*(x1 - x2)*(x1 - x3)*(x1 - x4)*(x1 - x5)*(x1 - x6)*(x1 - x7)*(x1 - x8)^2
#deg = 1



#n=9
s91 = [[x1, x5, x7, x9], [x1, x6, x7, x8], [x3, x5, x6, x7], [x1, x4, x5, x9], [x1, x2, x3, x9], [x1, x3, x4, x6]]
# gcd: (x1*x3*x4 - x1*x4*x5 - x1*x3*x6 + x1*x4*x6 - x3*x4*x6 + x3*x5*x6 - x1*x4*x7 + x1*x5*x7 - x3*x5*x7 + x4*x5*x7 + x3*x6*x7 - x5*x6*x7)*(x1 - x3)*(x1 - x4)*(x1 - x5)*(x1 - x6)*(x1 - x7)*(x1 - x9)^2*(x3 - x6)*(x3 - x9)*(x5 - x7)*(x5 - x9)*(x6 - x7)
#deg = 2


# Non Cerberus 
badsets1 = [[x1, x2, x3, x4], [x1, x2, x3, x5], [x3, x4, x6, x7], [x2, x3, x4, x5]] 
badsets2 = [[x1, x2, x3, x4], [x1, x2, x3, x5], [x1, x3, x4, x5], [x2, x3, x4, x5], [x5, x6, x7, x8]]
badsets3 = [[x1, x2, x3, x4], [x1, x2, x5, x6], [x1, x2, x6, x7], [x1, x5, x6, x7]]


def build_matrix(sets):
    # given n, a collection of size 4 sets in [n], build the matrix we want
    n = len(sets)+3
    matrix = []
    for r in range(0, len(sets)):
        row = []
        current = sets[r]
        sign = 1
        for c in range(0, n):
            varc = gens[c]
            if varc in current:
                comp = [x for x in current if x != varc]
                M = Matrix([[1, i, i^2] for i in comp])
                det = M.determinant()
                row.append(sign*det)
                sign = sign*(-1)
            else: 
                row.append(0)
        matrix.append(row)
    return Matrix(matrix)


def gcd_minors(sets):
    n = len(sets)+3
    M = build_matrix(sets)
    max_minors = M.minors(n-3)
    return gcd(max_minors).factor()

def minor_ratios(sets):
    n = len(sets)+3
    M = build_matrix(sets)
    max_minors = M.minors(n-3)
    g = gcd(max_minors)
    return [(m/g).factor() for m in max_minors]

def minors_in_gcd(sets):
    # find the smaller minors that show up in gcd
    n = len(sets)+3
    gcd = gcd_minors(sets)
    result = []
    for i in range(1, n-3):
        i_minors = build_matrix(sets).minors(i)
        result += [(i, m.factor()) for m in i_minors if (m!=0) and ((gcd/m) in R) ]
    return result


def which_minors(sets):
    # tells which (n-4)^2 minors realize the gcd
    n = len(sets)+3
    gcd = gcd_minors(sets)
    result = []
    
    i = n-4
    row_ind = Combinations(range(0, n-3), i).list()
    col_ind = Combinations(range(0, n), i).list()
    minor_ind = []
    for pair in itertools.product(row_ind, col_ind): 
        minor_ind.append(pair)
    minors = build_matrix(sets).minors(i)
    
    result = []
    for (index, minor) in zip(minor_ind, minors):
        if gcd == minor or -gcd == minor:
            print((index, minor.factor()))

#computes the (n-4) x (n-4) minors obtained by deleting some S_i and the rows corresponding to S_i
#conjecturally determinant of any of these minors is the gcd of the minors
def special_minors(sets):
    n = len(sets) + 3
    submatrices = []
    M = build_matrix(sets)
    for i in range(len(sets)):
        rs = set(range(len(sets))).difference({i})
        #makes set out of S_i
        seti = []
        for j in range(n):
            if(gens[j] in sets[i]):
                seti.append(j)
        cs = set(range(n)).difference(set(seti))
        submatrices.append(M.matrix_from_rows_and_columns(rs, cs))
    return submatrices


#computes the minimal polynomials of special minors
def minimal_polynomials(sets):
    L = special_minors(sets)
    for i in range(len(sets)):
        print(L[i].minimal_polynomial())


def minor_signs(sets):
    L = special_minors(sets)
    p = gcd_minors(sets)
    for i in range(len(sets)):
        r = L[i].det()/p
        print(r.factor())


def JF(sets):
    # gives the jordan forms of the (n-3)^2 submatrices. 
    n = len(sets)+3
    gcd = gcd_minors(sets)
    result = []
    
    i = n-3
    row_ind = Combinations(range(0, n-3), i).list()
    col_ind = Combinations(range(0, n), i).list()
    minor_ind = []
    for pair in itertools.product(row_ind, col_ind): 
        minor_ind.append(pair)
    
    JFs = []
    matrix = build_matrix(sets)
    for pair in minor_ind:
        submatrix = matrix[list(pair)[0], list(pair)[1]]
        JFs.append(submatrix.jordan_form())
    return JFs

def full_matrix(sets):
    # given n, a collection of size 4 sets in [n], build the matrix we want
    n = len(sets)+3
    matrix = []
    for r in range(0, len(sets)):
        row = []
        current = sets[r]
        sign = 1
        for c in range(0, n):
            varc = gens[c]
            if varc in current:
                comp = [x for x in current if x != varc]
                M = Matrix([[1, i, i^2] for i in comp])
                det = M.determinant()
                row.append(sign*det)
                sign = sign*(-1)
            else: 
                row.append(0)
        matrix.append(row)
    for i in range(0, 3):
        row = [x**i for x in gens[0:n]]
        matrix.append(row)
    return Matrix(matrix)
 
full_matrix(s51).determinant().factor()
