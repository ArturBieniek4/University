n=10
G='''1 2
2 3
3 4
4 5
5 6'''

def dfs(visited, graph, node, alone):
    if visited[node]==False:
        visited[node]=True
        was_n_alone=False
        for neighbour in graph[node]:
            if alone[neighbour]==True:
                was_n_alone=True
                break
        if not was_n_alone:
            alone[node]=True
        for neighbour in graph[node]:
            dfs(visited, graph, node, alone)

graph=[[] for i in range(n)]
for line in G.split("\n"):
    graph[int(line.split()[0])].append(int(line.split()[1]))
    graph[int(line.split()[1])].append(int(line.split()[0]))

visited=[False for i in range(len(graph))]
alone=[False for i in range(len(graph))]
for i in range(len(graph)):
    dfs(visited, graph, i, alone)

for i in range(len(alone)):
    if alone[i]:
        print(i, end=" ")