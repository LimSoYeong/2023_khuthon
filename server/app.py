import streamlit as st
from PyPDF2 import PdfReader

file = st.file_uploader('파일 선택(.pdf)', type = ['pdf'])

if file is not None :
    pdfreader = PdfReader(file)
    count = len(pdfreader.pages)
    text = ''
    for i in range(count) :
        page = pdfreader.pages[i]
        text = text + page.extract_text()
    st.write(text)
