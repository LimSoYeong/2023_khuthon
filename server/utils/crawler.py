import pandas as pd
import time,os,requests
from datetime import datetime
import warnings
warnings.filterwarnings(action="ignore")

from bs4 import BeautifulSoup as bs

def open_page(url) :
    req=requests.get(url).text
    page=bs(req,"html.parser")
    return page

def get_title(page) :
    title = page.find('div', {'class':'head-wrapper'})
    title = title.find('h1').text
    return title

def get_user(page) :
    user = page.find('a',{'class' : 'user-logo'}).text
    return user

def get_thumnail(page) :
    img_all = page.find_all('img')
    img_src = img_all[0].get('src')
    return img_src

def get_text(page) :
    text_all = page.find_all(['p','h1','h2','h3','li'])
    text=""
    for t in text_all :
        text += t.text
    return text

def crawler(link):
    page = open_page(link)
    title = get_title(page)
    user = get_user(page)
    img = get_thumnail(page)
    text = get_text(page)
    result = {'title' : title, 'user' : user, 'img' : img, 'text' : text }
    return result
        
