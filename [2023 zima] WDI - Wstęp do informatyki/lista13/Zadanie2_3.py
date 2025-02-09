import copy
def dfs_path_exists(visited, graph, node1, node2):
    if node1 == node2:
        return True
    if node1 not in visited:
        visited.append(node1)
        for neighbour in graph[node1]:
            if dfs_path_exists(visited, graph, neighbour, node2):
                return True
    return False

def is_bridge(graph, u, v, n):
    graph_copy = copy.deepcopy(graph)
    graph_copy[u].remove(v)
    graph_copy[v].remove(u)
    return not(dfs_path_exists([], graph_copy, u, v))

def bridge_exists(graph, n):
    for v in range(n):
        for e in graph[v]:
            if is_bridge(graph, v, e, n):
                return True
    return False

graph1 = [[3, 4], [2, 3], [1, 3], [0, 1, 2], [0]]
graph2 = [
    [2, 5], [4, 6], [0, 3], [2, 4, 5], [1, 3], [0, 3, 6], [5, 1]
]
print(is_bridge(graph1, 1, 3, 5))
print(is_bridge(graph1, 0, 4, 5))
print(bridge_exists(graph1, 5))
print(bridge_exists(graph2, 7))

'''
def bfs(graph_, node):
    visited = []
    queue = []
    visited.append(node)
    queue.append(node)

    while queue:
        m = queue.pop(0)  
        for neighbour in graph_[int(m)]:
            if neighbour not in visited:
                visited.append(neighbour)
                queue.append(neighbour)
    return visited

def is_bridge2(graph, u, v, n):
    graph_copy = copy.deepcopy(graph)
    graph_copy[u].remove(v)
    graph_copy[v].remove(u)
    return len(bfs(graph_copy, u)) != n

def bridge_exists2(graph, n):
    for v in range(n):
        for e in graph[v]:
            if is_bridge2(graph, v, e, n):
                return True
    return False
'''