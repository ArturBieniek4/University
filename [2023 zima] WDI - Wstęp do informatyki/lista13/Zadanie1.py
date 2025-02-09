graph1_list = [
    [], [4, 6], [3], [2, 4, 5], [3, 1], [3,6], [5,1]
]

def list_to_matrix(g_list, n):
    g_matrix = [[0 for i in range(n)] for j in range(n)]
    for v in range(n):
        for e in g_list[v]:
            g_matrix[v][e] = 1
    return g_matrix

graph1_matrix = list_to_matrix(graph1_list, 7)
# print(graph1_matrix[0])
for row in graph1_matrix:
    print(row)

def matrix_to_list(g_matrix, n):
    g_list = [[] for i in range(n)]
    for i in range(n):
        v_list = []
        for j in range(n):
            if g_matrix[i][j] == 1:
                v_list.append(j)
        g_list[i] = v_list
    return g_list

graph1_list2 = matrix_to_list(graph1_matrix, 7)
print(graph1_list2)