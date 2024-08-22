def find_shortest_path(graph, u, v, n): #bfs
    d = [-1 for _ in range(n)]
    queue = []
    queue.append(u)
    d[u] = [u]
    while queue:
        m = queue.pop(u)
        for neighbour in graph[m]:
            if d[neighbour] == -1:
                queue.append(neighbour)  # Dodajemy sąsiada do kolejki
                d[neighbour] = d[m] + [neighbour]
    return len(d[v])-1, d[v]

graph1 = [[3, 4], [2, 3], [1], [0, 1, 4], [0, 3]]
graph2 = [
    [2, 5], [4, 6], [0, 3], [2, 4, 5], [1, 3], [0, 3, 6], [5, 1]
]

print(find_shortest_path(graph2, 0, 1, 7))