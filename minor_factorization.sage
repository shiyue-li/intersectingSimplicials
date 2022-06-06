# Authors: Matt Larson, Shiyue Li

N = 10 # a big number 
R = PolynomialRing(QQ, N, 'x')
gen_list = list(R.gens())
gen_string = [str(i) for i in R.gens()]
gens = [var(gen_string[i]) for i in range(1, len(gen_list))]

# Cerberus
s51 = [[x1, x2, x3, x4], [x1, x2, x3, x5]] 

# n = 6
s61 = [[x1, x2, x3, x4], [x1, x2, x5, x6], [x3, x4, x5, x6]] 
# gcd: -(x1*x2*x3 + x1*x2*x4 - x1*x3*x4 - x2*x3*x4 - x1*x2*x5 + x3*x4*x5 - x1*x2*x6 + x3*x4*x6 + x1*x5*x6 + x2*x5*x6 - x3*x5*x6 - x4*x5*x6)*(x1 - x2)*(x3 - x4)*(x5 - x6)
s62 = [[x1, x2, x3, x4], [x1, x2, x3, x5], [x1, x2, x3, x6]] 
# gcd: (x1 - x2)^2*(x1 - x3)^2*(x2 - x3)^2
s63 = [[x1, x2, x3, x4], [x1, x2, x5, x6], [x1, x2, x3, x5]] 
# gcd: (x1 - x2)^2*(x1 - x3)*(x1 - x5)*(x2 - x3)*(x2 - x5)


# n = 7
s71 = [[x1, x2, x6, x7], [x4, x5, x6, x7], [x1, x2, x3, x5], [x1, x2, x3, x4]] 
# gcd: -(x1*x2*x4 + x1*x2*x5 - x1*x4*x5 - x2*x4*x5 - x1*x2*x6 + x4*x5*x6 - x1*x2*x7 + x4*x5*x7 + x1*x6*x7 + x2*x6*x7 - x4*x6*x7 - x5*x6*x7)*(x1 - x2)^2*(x1 - x3)*(x2 - x3)*(x4 - x5)*(x6 - x7)
# minors in gcd
# (1, (x1 - x2)*(x1 - x3)*(x2 - x3))
# (1, (x1 - x2)*(x1 - x3)*(x2 - x3))
# (2, (x1*x2*x4 + x1*x2*x5 - x1*x4*x5 - x2*x4*x5 - x1*x2*x6 + x4*x5*x6 - x1*x2*x7 + x4*x5*x7 + x1*x6*x7 + x2*x6*x7 - x4*x6*x7 - x5*x6*x7)*(x1 - x2)*(x4 - x5)*(x6 - x7))
# (3, (x1*x2*x4 + x1*x2*x5 - x1*x4*x5 - x2*x4*x5 - x1*x2*x6 + x4*x5*x6 - x1*x2*x7 + x4*x5*x7 + x1*x6*x7 + x2*x6*x7 - x4*x6*x7 - x5*x6*x7)*(x1 - x2)^2*(x1 - x3)*(x2 - x3)*(x4 - x5)*(x6 - x7))
# (3, (x1*x2*x4 + x1*x2*x5 - x1*x4*x5 - x2*x4*x5 - x1*x2*x6 + x4*x5*x6 - x1*x2*x7 + x4*x5*x7 + x1*x6*x7 + x2*x6*x7 - x4*x6*x7 - x5*x6*x7)*(x1 - x2)^2*(x1 - x3)*(x2 - x3)*(x4 - x5)*(x6 - x7))
# (3, (x1*x2*x4 + x1*x2*x5 - x1*x4*x5 - x2*x4*x5 - x1*x2*x6 + x4*x5*x6 - x1*x2*x7 + x4*x5*x7 + x1*x6*x7 + x2*x6*x7 - x4*x6*x7 - x5*x6*x7)*(x1 - x2)^2*(x1 - x3)*(x2 - x3)*(x4 - x5)*(x6 - x7))
# (3, -(x1*x2*x4 + x1*x2*x5 - x1*x4*x5 - x2*x4*x5 - x1*x2*x6 + x4*x5*x6 - x1*x2*x7 + x4*x5*x7 + x1*x6*x7 + x2*x6*x7 - x4*x6*x7 - x5*x6*x7)*(x1 - x2)^2*(x1 - x3)*(x2 - x3)*(x4 - x5)*(x6 - x7))
# -(x1*x2*x4 + x1*x2*x5 - x1*x4*x5 - x2*x4*x5 - x1*x2*x6 + x4*x5*x6 - x1*x2*x7 + x4*x5*x7 + x1*x6*x7 + x2*x6*x7 - x4*x6*x7 - x5*x6*x7)*(x1 - x2)^2*(x1 - x3)*(x2 - x3)*(x4 - x5)*(x6 - x7)

s72 = [[x1, x2, x3, x6], [x1, x5, x6, x7], [x1, x2, x3, x5], [x2, x3, x4, x5]] 
# gcd: (x1 - x2)*(x1 - x3)*(x1 - x5)*(x1 - x6)*(x2 - x3)^2*(x2 - x5)*(x3 - x5)*(x5 - x6)

# n = 8
s81 = [[x1, x2, x3, x4], [x1, x2, x3, x5], [x1, x2, x6, x7], [x3, x4, x7, x8], [x5, x6, x7, x8]]
# gcd: (x1*x2*x3*x5^2 + x1*x2*x4*x5^2 - x1*x3*x4*x5^2 - x2*x3*x4*x5^2 + x1*x2*x3*x4*x6 - x1*x2*x3*x5*x6 - x1*x2*x4*x5*x6 + x3*x4*x5^2*x6 - x1*x2*x3*x5*x7 - x1*x2*x4*x5*x7 + x1*x3*x4*x5*x7 + x2*x3*x4*x5*x7 - x1*x2*x5^2*x7 + x3*x4*x5^2*x7 - x1*x3*x4*x6*x7 - x2*x3*x4*x6*x7 + x1*x2*x5*x6*x7 + x1*x3*x5*x6*x7 + x2*x3*x5*x6*x7 + x1*x4*x5*x6*x7 + x2*x4*x5*x6*x7 - x3*x4*x5*x6*x7 - x3*x5^2*x6*x7 - x4*x5^2*x6*x7 + x1*x2*x5*x7^2 - x3*x4*x5*x7^2 + x3*x4*x6*x7^2 - x1*x5*x6*x7^2 - x2*x5*x6*x7^2 + x5^2*x6*x7^2 - x1*x2*x3*x4*x8 + x1*x3*x4*x5*x8 + x2*x3*x4*x5*x8 - x1*x2*x5^2*x8 + x1*x2*x5*x6*x8 - x3*x4*x5*x6*x8 + x1*x2*x3*x7*x8 + x1*x2*x4*x7*x8 + x1*x2*x5*x7*x8 - x1*x3*x5*x7*x8 - x2*x3*x5*x7*x8 - x1*x4*x5*x7*x8 - x2*x4*x5*x7*x8 - x3*x4*x5*x7*x8 + x1*x5^2*x7*x8 + x2*x5^2*x7*x8 - x1*x2*x6*x7*x8 + x3*x4*x6*x7*x8 - x1*x5*x6*x7*x8 - x2*x5*x6*x7*x8 + x3*x5*x6*x7*x8 + x4*x5*x6*x7*x8 - x1*x2*x7^2*x8 + x3*x5*x7^2*x8 + x4*x5*x7^2*x8 - x5^2*x7^2*x8 + x1*x6*x7^2*x8 + x2*x6*x7^2*x8 - x3*x6*x7^2*x8 - x4*x6*x7^2*x8)*(x1 - x2)^2*(x1 - x3)*(x2 - x3)*(x3 - x4)*(x6 - x7)*(x7 - x8)

s82 = [[x1, x2, x3, x4], [x1, x2, x3, x5], [x1, x2, x6, x7], [x3, x4, x7, x8], [x5, x6, x7, x8]]
# gcd : (x1*x2*x3*x5^2 + x1*x2*x4*x5^2 - x1*x3*x4*x5^2 - x2*x3*x4*x5^2 + x1*x2*x3*x4*x6 - x1*x2*x3*x5*x6 - x1*x2*x4*x5*x6 + x3*x4*x5^2*x6 - x1*x2*x3*x5*x7 - x1*x2*x4*x5*x7 + x1*x3*x4*x5*x7 + x2*x3*x4*x5*x7 - x1*x2*x5^2*x7 + x3*x4*x5^2*x7 - x1*x3*x4*x6*x7 - x2*x3*x4*x6*x7 + x1*x2*x5*x6*x7 + x1*x3*x5*x6*x7 + x2*x3*x5*x6*x7 + x1*x4*x5*x6*x7 + x2*x4*x5*x6*x7 - x3*x4*x5*x6*x7 - x3*x5^2*x6*x7 - x4*x5^2*x6*x7 + x1*x2*x5*x7^2 - x3*x4*x5*x7^2 + x3*x4*x6*x7^2 - x1*x5*x6*x7^2 - x2*x5*x6*x7^2 + x5^2*x6*x7^2 - x1*x2*x3*x4*x8 + x1*x3*x4*x5*x8 + x2*x3*x4*x5*x8 - x1*x2*x5^2*x8 + x1*x2*x5*x6*x8 - x3*x4*x5*x6*x8 + x1*x2*x3*x7*x8 + x1*x2*x4*x7*x8 + x1*x2*x5*x7*x8 - x1*x3*x5*x7*x8 - x2*x3*x5*x7*x8 - x1*x4*x5*x7*x8 - x2*x4*x5*x7*x8 - x3*x4*x5*x7*x8 + x1*x5^2*x7*x8 + x2*x5^2*x7*x8 - x1*x2*x6*x7*x8 + x3*x4*x6*x7*x8 - x1*x5*x6*x7*x8 - x2*x5*x6*x7*x8 + x3*x5*x6*x7*x8 + x4*x5*x6*x7*x8 - x1*x2*x7^2*x8 + x3*x5*x7^2*x8 + x4*x5*x7^2*x8 - x5^2*x7^2*x8 + x1*x6*x7^2*x8 + x2*x6*x7^2*x8 - x3*x6*x7^2*x8 - x4*x6*x7^2*x8)*(x1 - x2)^2*(x1 - x3)*(x2 - x3)*(x3 - x4)*(x6 - x7)*(x7 - x8)

s83 = [[x1, x3, x4, x6], [x5, x6, x7, x8], [x1, x5, x6, x7], [x1, x2, x5, x8], [x1, x3, x5, x7]]
# gcd : (x1 - x3)*(x1 - x5)^2*(x1 - x6)*(x1 - x7)*(x1 - x8)*(x3 - x6)*(x5 - x6)*(x5 - x7)^2*(x5 - x8)*(x6 - x7)


s91 = [[x1, x5, x7, x9], [x1, x6, x7, x8], [x3, x5, x6, x7], [x1, x4, x5, x9], [x1, x2, x3, x9], [x1, x3, x4, x6]]

# Non Cerberus 
badsets1 = [[x1, x2, x3, x4], [x1, x2, x3, x5], [x1, x2, x3, x6], [x2, x3, x4, x5]] # 

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

for minor in minors_in_gcd(s61):
    print(minor)
        
    
