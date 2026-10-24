import streamlit as st
import pandas as pd
import numpy as np
import pickle

st.title("🏡 Real-Time Price Predictor")

# 1. Load the pickle model safely using Streamlit's caching
@st.cache_resource  # Keeps the model in memory so it doesn't reload on every click
def load_my_model():
    # Make sure 'poly_model.pkl' is in the exact same folder as app.py
    with open('poly_model.pkl', 'rb') as file:
        return pickle.load(file)

model = load_my_model()

# 2. Build the User Interface (sliders/inputs)
st.subheader("Modify Features to Predict Price")
feature_a = st.slider("Square Footage", min_value=500, max_value=5000, value=1500)
feature_b = st.slider("Number of Bedrooms", min_value=1, max_value=5, value=3)

# 3. Predict and Output results when user clicks the button
if st.button("Calculate Predicted Price"):
    # Format the inputs into a 2D array that matches your training shape
    user_features = np.array([[feature_a, feature_b]])
    
    # Generate prediction from the pickle model
    prediction = model.predict(user_features)
    
    # Display the result
    st.success(f"🎯 Estimated Price: ${prediction[0]:,.2f}")
import streamlit as st
import pandas as pd
import numpy as np
import pickle

st.title("🏡 Real-Time Price Predictor")

# 1. Load the pickle model safely using Streamlit's caching
@st.cache_resource  # Keeps the model in memory so it doesn't reload on every click
def load_my_model():
    # Make sure 'poly_model.pkl' is in the exact same folder as app.py
    with open('poly_model.pkl', 'rb') as file:
        return pickle.load(file)

model = load_my_model()

# 2. Build the User Interface (sliders/inputs)
st.subheader("Modify Features to Predict Price")
feature_a = st.slider("Square Footage", min_value=500, max_value=5000, value=1500)
feature_b = st.slider("Number of Bedrooms", min_value=1, max_value=5, value=3)

# 3. Predict and Output results when user clicks the button
if st.button("Calculate Predicted Price"):
    # Format the inputs into a 2D array that matches your training shape
    user_features = np.array([[feature_a, feature_b]])
    
    # Generate prediction from the pickle model
    prediction = model.predict(user_features)
    
    # Display the result
    st.success(f"🎯 Estimated Price: ${prediction[0]:,.2f}")
