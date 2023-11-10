import pandas as pd

def update_url(result) :
    new_data = {'Title' : result['title'], 'thumbnail' : result['img'], 'text' : result['text'] }
    pre_url = pd.read_csv('./data/urls.csv', index_col = 0)
    new_url = pd.concat([pre_url, pd.DataFrame([new_data])], ignore_index=True)
    new_url.to_csv('./data/urls.csv')
    return (len(new_url) - 1)
