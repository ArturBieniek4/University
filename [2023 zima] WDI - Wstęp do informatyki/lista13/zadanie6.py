def dfs(visited, graph, node1):
    if node1 not in visited:
        # print("VIS", node1)
        visited.append(node1)
        for neighbour in graph[node1]:
            res=dfs(visited, graph, neighbour)

def hcc(visited, graph, ignore):
    hcc_cnt=0
    visited.append(ignore)
    for v in range(len(graph)):
        if v not in visited:
            hcc_cnt+=1
            # print(hcc_cnt, v)
            dfs(visited, graph, v)
    return hcc_cnt

graph1 = [[] for i in range(7)]
graph_opis = '''3 2
3 4
4 1
4 5
5 3
5 6
6 1'''

for line in graph_opis.split("\n"):
    graph1[int(line.split()[0])].append(int(line.split()[1]))
    graph1[int(line.split()[1])].append(int(line.split()[0]))

def is_splitpoint(graph, v):
    return hcc([], graph, -1)<hcc([], graph, v)

print(hcc([], graph1, -1))
print(hcc([], graph1, 0))
print(hcc([], graph1, 3))
print(is_splitpoint(graph1, 0))
print(is_splitpoint(graph1, 3))