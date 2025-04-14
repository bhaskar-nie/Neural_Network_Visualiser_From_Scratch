# Neural Network Visualizer
An interactive web application that visualizes the training and behavior of a neural network built from scratch using only NumPy. This educational tool helps you understand the inner workings of neural networks by providing real-time visualization of the training process.

### Key Visualizations

## Exploratory Data Analysis - Knowing our Dataset
![EDA](https://github.com/user-attachments/assets/54ef564b-f9d8-4872-8384-084bef1d4d47)


## Training Process
![Training](https://github.com/user-attachments/assets/f42e5ab7-8741-45d2-8332-ebdae6fa691e)
![Training](https://github.com/user-attachments/assets/324d41d1-d263-4c82-9651-561719cf92d7)

## Prediction Testing
![Prediction](https://github.com/user-attachments/assets/c198cd1a-b3ef-4426-a854-ad75b9a5208a)
![Prediction](https://github.com/user-attachments/assets/e20fe700-7573-42fe-9e88-7f5fa023b053)
## 🧠 Neural Network Architecture

This project implements a feedforward neural network with the following architecture:

```
Input Layer (2 neurons) → Hidden Layer (2 neurons) → Output Layer (1 neuron)
```

<p align="center">
  <img src="https://github.com/user-attachments/assets/2613c5e9-51b7-47aa-81f7-5d0828f63113" alt="2-2-1 Neural Network Architecture" width="600">
</p>

### Technical Details

- **Network Structure**: 2-2-1 feedforward neural network (2 input neurons, 2 hidden neurons, 1 output neuron)
- **Total Parameters**: 9 trainable parameters
  - Weights: 6 parameters (4 between input and hidden, 2 between hidden and output)
  - Biases: 3 parameters (2 for hidden neurons, 1 for output neuron)
- **Activation Function**: Sigmoid for all neurons
- **Loss Function**: Binary Cross-Entropy
- **Optimization**: Gradient Descent with customizable learning rate
- **Implementation**: Built from scratch using pure NumPy with no deep learning frameworks

### Mathematical Foundation

The network performs the following computations:

1. **Forward Propagation**:
   - Z = W·X + b (linear transformation)
   - A = σ(Z) (sigmoid activation, where σ(x) = 1/(1+e^(-x)))

2. **Loss Calculation**:
   - Binary Cross-Entropy: L = -[y·log(ŷ) + (1-y)·log(1-ŷ)]

3. **Backpropagation**:
   - Compute gradients for each parameter (∂L/∂W, ∂L/∂b)
   - Update parameters: θ = θ - α·∂L/∂θ (where α is the learning rate)

## 🔍 Overview

This application provides an end-to-end experience for:

- **Data Exploration**: Interactive visualization of the placement dataset
- **Model Training**: Configure and train a neural network with real-time visualization
- **Model Testing**: Test the trained model with custom inputs
- **Decision Boundary Visualization**: See how the model classifies the feature space

All neural network computations are implemented from scratch using only NumPy, making the inner workings transparent and educational.

## 🏛️ Project Structure

```
├── backend/                # Flask backend
│   ├── app/                # Application code
│   │   ├── __init__.py
│   │   ├── api.py          # API endpoints
│   │   └── neural_network.py # Neural network implementation
│   ├── static/             # Static files
│   │   ├── models/         # Saved models
│   ├── requirements.txt    # Python dependencies
│   └── wsgi.py             # WSGI entry point
├── frontend/               # React frontend
│   ├── public/
│   ├── src/
│   │   ├── components/     # React components
│   │   │   └── NeuralNetworkVisualizer.tsx # Neural network visualization
│   │   ├── pages/          # Page components
│   │   ├── services/       # API services
│   │   ├── types/          # TypeScript type definitions
│   │   └── utils/          # Utility functions
│   ├── package.json
│   └── tsconfig.json
├── docs/                   # Documentation and images
│   └── images/             # Screenshots for README
├── placement-dataset.csv   # Dataset file (required in project root)
├── .gitignore              # Git ignore file
├── LICENSE                 # MIT License
└── README.md               # This file
```

## 📊 Dataset

The application uses a placement dataset containing:
- `cgpa`: Cumulative Grade Point Average of students
- `iq`: IQ scores of students
- `placement`: Target variable (1 = placed, 0 = not placed)

The dataset must be present in both the project root directory and the `backend/app/` directory.

## ✨ Features

### 1. Dataset Analysis
- Interactive scatter plots and histograms
- Statistical summaries and correlations
- Train/test split visualization

### 2. Neural Network Training
- Configurable learning rate and epochs
- Real-time visualization of:
  - Network weights (displayed on arrows, color-coded)
  - Neuron biases (displayed inside neurons)
  - Loss and accuracy charts
  - Decision boundary evolution

### 3. Prediction Testing
- Test with custom CGPA and IQ inputs
- Visualize data flow through the network
- Probability score with confidence indicator

## 🚀 Getting Started

### Prerequisites
- Python 3.7+
- Node.js 14+
- npm or yarn

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/bhaskar-nie/Neural_Network_Visualiser_From_Scratch.git
   cd neural-network-visualizer
   ```

2. Set up the backend:
   ```bash
   cd backend
   pip install -r requirements.txt
   ```

3. Set up the frontend:
   ```bash
   cd frontend
   npm install
   ```

4. Ensure the dataset is copied to both locations:
   ```bash
   # For Windows
   Copy-Item "placement-dataset.csv" -Destination "backend\app\"
   
   # For Linux/Mac
   cp placement-dataset.csv backend/app/
   ```

### Running the Application

1. Start the backend:
   ```bash
   cd backend
   python wsgi.py
   ```

2. Start the frontend (in a separate terminal):
   ```bash
   cd frontend
   npm start
   ```

3. Open your browser and navigate to `http://localhost:3000`
