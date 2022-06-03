N = 10 # a big number 
R = PolynomialRing(QQ, N, 'x')
gen_list = list(R.gens())
gen_string = [str(i) for i in R.gens()]
gens = [var(gen_string[i]) for i in range(1, len(gen_list))]

# Cerberus 
goodsets1 = [[x1, x2, x3, x4], [x1, x2, x5, x6], [x3, x4, x5, x6]] # n = 6
goodsets2 = [[x1, x2, x6, x7], [x4, x5, x6, x7], [x1, x2, x3, x5], [x1, x2, x3, x4]] # n = 7
goodsets3 = [[x1, x2, x3, x4], [x1, x2, x3, x5], [x1, x2, x6, x7], [x3, x4, x7, x8], [x5, x6, x7, x8]] # n = 8

# Non Cerberus 
badsets1 = [[x1, x2, x3, x4], [x1, x2, x3, x5], [x1, x2, x3, x6], [x2, x3, x4, x5]] # 

def build_matrix(n, sets):
    # given n, a collection of size 4 sets in [n], build the matrix we want
    R = PolynomialRing(RR, n, 'x')
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

# check that non-vanishing of Cerberus sets holds.  
for sets in [goodsets1, goodsets2, goodsets3]:
    n = len(sets) + 3
    M = build_matrix(n, sets)
    max_minors = M.minors(n-3)
    print("n is ", n, " ; ", max_minors)
    check_zero = [True if minor == 0 else False for minor in max_minors]
    print(check_zero)

# check that the max minors of the non-Cerberus sets is zero 
badM = build_matrix(7, badsets1)
max_minors = badM.minors(4)
check_zero = [True if minor == 0 else False for minor in max_minors]
print(check_zero)

    
