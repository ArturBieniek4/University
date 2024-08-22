def dfs(visited, graph, node, parent):
    # print(node1, node2)
    if visited[node]==0:
        visited[node]=1
        for neighbour in graph[node]:
            if neighbour!=parent and visited[neighbour]==1:
                if node==neighbour: return True, [node]
                return True, [node, neighbour]
            res=dfs(visited, graph, neighbour, node)
            if res!=None:
                #print(res)
                if res[0]:
                    return res[1][-1]!=node, res[1][-1]!=node and [node]+res[1] or res[1]
                else:
                    return False, res[1]
        visited[node]=2

graph1 = [
    [0], [], [], [2, 4], [1, 5], [3, 6], [1]
]

graph2 = [
    [1], [2], [0], [2, 4], [1, 5], [3, 6], [1]
]

graph3 = [
    [1], [2], [3], [4], [5], [6], [4]
]

def is_cycle(graph):
    visited=[0 for i in range(len(graph))]
    for v in range(len(graph)):
        res=dfs(visited, graph, v, -1)
        if res!=None:
            return res[1]

print(is_cycle(graph1))
print(is_cycle(graph2))
print(is_cycle(graph3))