import pandas as pd
from pyvis.network import Network

def make_graph(new_node) :

    df = pd.read_csv('./data/weight.csv')
    df['weight'] = df['weight']*100
    df['doc1'] = df['doc1'].astype(str)
    df['doc2'] = df['doc2'].astype(str)
    df = df.drop(df[df['weight'] < 5].index, axis=0)

    net = Network(
        notebook = True,
        directed = False,            # directed graph
        height = "1000px",          # height of chart
        width = "100%",             # fill the entire width
        )

    net.barnes_hut(gravity=-8000, central_gravity=0.6, spring_length=200, spring_strength=0.001, damping=0.09, overlap=0)

    sources = df['doc1']
    targets = df['doc2']
    weights = df['weight']

    edge_data = zip(sources, targets, weights)

    for e in edge_data:
        src = e[0]
        dst = e[1]
        w = e[2]

        net.add_node(src, src, title=src)
        net.add_node(dst, dst, title=dst)
        if src == str(new_node) or dst == str(new_node) :
            net.add_edge(src, dst, value=w, color = 'red')
        else :
            net.add_edge(src, dst, value=w)
            
    net.save_graph("./templates/graph.html")
