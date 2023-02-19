#!/usr/bin/env python
# coding: utf-8

# In[12]:


import streamlit as st
import pandas as pd
from sklearn import datasets
from matplotlib import pyplot as plt
import matplotlib.patches
import altair as alt
import seaborn as sns

# In[13]:


breast_cancer = datasets.load_breast_cancer(as_frame=True)

breast_cancer_df = pd.concat((breast_cancer["data"], breast_cancer["target"]), axis=1)

breast_cancer_df["target"] = [breast_cancer.target_names[val] for val in breast_cancer_df["target"]]


# In[14]:


st.set_page_config(page_title='Breast Cancer Stats', layout='wide')
st.markdown(body = 'Breast cancer stats')
st.write(breast_cancer_df.head(5))

# Scatter drop down

st.sidebar.markdown('Scatter chart dimensions, point selected will display in red')

sct_box_y = st.sidebar.selectbox( "Select mean radius", breast_cancer_df['mean radius'].sort_values()) ## 1 is a unique key
sct_box_x = st.sidebar.selectbox( "Select mean texture", breast_cancer_df['mean texture'].sort_values(), index=1) ## 1 is a unique key


if sct_box_x != None and sct_box_y != None:
    
    fig, ax = plt.subplots()
    ax.scatter(x= sct_box_x, y = sct_box_y, color='red')
    levels, categories = pd.factorize(breast_cancer_df['target'])
    colors = [plt.cm.tab10(i) for i in levels] # using the "tab10" colormap
    handles = [matplotlib.patches.Patch(color=plt.cm.tab10(i), label=c) for i, c in enumerate(categories)]
    ax.scatter(x=breast_cancer_df['mean radius'], y= breast_cancer_df['mean texture'],c=colors)
    plt.xlabel('Mean texture')
    plt.ylabel('Mean radius')
    plt.legend(handles=handles)
    st.pyplot(fig)
else:
    pass

st.sidebar.markdown('Bar chart dimensions')
bar_box = st.sidebar.multiselect( "bar chart data selection", breast_cancer_df.columns,\
                                  default=['mean radius', 'mean texture', 'mean perimeter', 'area error']) ## 1 is a unique key

chosen_col_df=pd.concat([breast_cancer_df[bar_box], breast_cancer_df['target']], axis=1)

#st.bar_chart(data=breast_cancer_df[bar_box].head(5))


## IF CLAUSE IF BARBAX != NONE
avg_breast_cancer_df=chosen_col_df.groupby("target").mean().reset_index(drop=False)
##st.write(avg_breast_cancer_df)
avg_melt_df=pd.melt(avg_breast_cancer_df,id_vars='target', var_name= 'variable')
fig2, ax = plt.subplots()
sns.barplot(data= avg_melt_df, x='target', y='value', hue='variable')
plt.title('Average value for benign and malignant tumours')
st.pyplot(fig2)
#chart =alt.Chart(breast_cancer_df).mark_bar().encode()
#st.altair_chart(chart)
st.sidebar.markdown('Histogram dimensions')
hist_box = st.sidebar.multiselect( "histogram data selection", ["Yes", "No"]) ## 1 is a unique key

hist_box = st.sidebar.radio( "histogram bin size", ["Yes", "No"] ,1) ## 1 is a unique key
