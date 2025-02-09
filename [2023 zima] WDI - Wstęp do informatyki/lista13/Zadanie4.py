def dfs_path_exists(visited, graph, node1, node2):
    # print(node1, node2)
    if node1 == node2:
        return [node1]
    if node1 not in visited:
        visited.append(node1)
        for neighbour in graph[node1]:
            res=dfs_path_exists(visited, graph, neighbour, node2)
            if res!=False:
                return res+[node1]
    return False

graph1 = [
    [], [], [], [2, 4], [1, 5], [3, 6], [1]
]

print(dfs_path_exists([], graph1, 3, 5))
print(dfs_path_exists([], graph1, 1, 4))