import pandas as pd
import nltk
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords as stwrds
from konlpy.tag import Okt
from sklearn.feature_extraction.text import TfidfVectorizer
from numpy import dot
from numpy.linalg import norm
from itertools import combinations, permutations

def get_df(file_path):
    df = pd.read_csv(file_path, index_col = 0)
    return df

def stopwords():
    path = "./stopword.txt"
    stopwords_df = get_df(path)
    nltk.download('punkt')
    nltk.download('stopwords')

    # 한국어 stopwords
    text_list = []
    with open(path, 'r', encoding='utf-8') as file:
        text_list = file.readlines()
    cleaned_list = [word.strip() for word in text_list]

    # 영어 stopwords
    eng_stopword = stwrds.words('english')

    # 특수문자 stopwords
    special_characters = list("~!@#$%^&*()_-+=[]{}|;':,.<>?/''")

    # 한국어 조사 리스트
    korean_particles = [
        '\n',
        '이', '가', '은', '는', '을', '를', '과', '와', '으로', '로', '에', '에서', '의', '에게', '에게서', '랑', '이랑', '처럼', '에서는',
        '에는', '와는', '한테', '에서는', '부터', '까지', '에도', '에만', '에서만', '조차', '마저', '에서부터', '으로부터', '로부터', '으로서', '로서',
        '에너', '같이', '만큼', '따라', '에게서', '보다', '같아서', '처럼', '같다', '같이', '만큼', '보다', '죠', '잖아', '라고', '라는', '이라고', '이라는',
    ]

    # 불용어 제거 리스트
    stop_words = cleaned_list + eng_stopword + special_characters + korean_particles
    return stop_words

# 숫자 지우기
def remove_numbers(sentence):
    result = ''.join(char for char in sentence if not char.isnumeric())
    return result


def preprocess(df, stop_words):
    # Okt(Open Korea Text) 토크나이저
    okt=Okt()
   
    result = []
    for txt in df['text']:
        txt = remove_numbers(txt)
        word_tokens = okt.morphs(txt)
        embedded = []
        for w in word_tokens:
            if w not in stop_words:
                embedded.append(w)
        result.append(' '.join(embedded))
    return result

def cos_sim(A, B):
  return dot(A, B)/(norm(A)*norm(B))

def get_weight(df, result):
    tfidfv = TfidfVectorizer().fit(result)
    doc_vec = tfidfv.transform(result).toarray()
    perm = list(combinations(range(len(df)), 2))
    print(doc_vec)

    weight_dict = {
        'doc1' : [],
        'doc2' : [],
        'weight' : []
    }

    for p in perm:
        weight_dict['doc1'].append(p[0])
        weight_dict['doc2'].append(p[1])
        weight_dict['weight'].append(cos_sim(doc_vec[p[0]], doc_vec[p[1]]))

    weight_df = pd.DataFrame(weight_dict)
    return weight_df

def main():
    file_path = "./urls.csv"
    df = get_df(file_path)
    stop_words = stopwords()
    result = preprocess(df, stop_words)
    print(len(result))
    weight_df = get_weight(df, result)
    weight_df.to_csv("weight_df.csv", index=False)
    
if __name__ == "__main__":
    main()

