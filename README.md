# Neural Network Visualizer

![React](https://img.shields.io/badge/React-18.x-61DAFB?logo=react)
![TypeScript](https://img.shields.io/badge/TypeScript-4.x-3178C6?logo=typescript)
![Flask](https://img.shields.io/badge/Flask-2.x-000000?logo=flask)
![Python](https://img.shields.io/badge/Python-3.7+-3776AB?logo=python)
![NumPy](https://img.shields.io/badge/NumPy-1.20+-013243?logo=numpy)

An interactive web application that visualizes the training and behavior of a neural network built from scratch using only NumPy. This educational tool helps you understand the inner workings of neural networks by providing real-time visualization of the training process.

## 📷 Application Showcase

<p align="center">
  <img src="docs/images/main-screen.png" alt="Neural Network Visualizer Main Screen" width="800">
  <br>
  <em>Main application interface showing the neural network visualization</em>
</p>

### Key Visualizations

| Exploratory Data Analysis | Training Process | Decision Boundary |
|:-------------------------:|:----------------:|:-----------------:|
| ![EDA](docs/images/eda.png) | ![Training](docs/images/training.png) | ![Decision Boundary](docs/images/decision-boundary.png) |
| *Dataset visualization with scatter plots and distributions* | *Neural network during training with weights and biases* | *Evolution of the decision boundary as model trains* |

| Prediction Testing | Parameter Influence |
|:------------------:|:-------------------:|
| ![Prediction](docs/images/prediction.png) | ![Parameters](docs/images/parameters.png) |
| *Testing the model with new inputs* | *How different parameters affect model performance* |

## 🧠 Neural Network Architecture

This project implements a feedforward neural network with the following architecture:

```
Input Layer (2 neurons) → Hidden Layer (2 neurons) → Output Layer (1 neuron)
```

<p align="center">
  <img src="docs/images/architecture.png" alt="2-2-1 Neural Network Architecture" width="600">
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
   git clone https://github.com/yourusername/neural-network-visualizer.git
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

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👏 Acknowledgments

- Neural network implementation from scratch using NumPy
- Visualization techniques optimized for educational purposes

## ⚠️ Troubleshooting

### Dataset Not Found

If you encounter "File not found" errors, ensure the dataset is in both required locations:
1. The project root directory
2. The backend/app directory

You can copy the dataset file using:
```bash
# For Windows
Copy-Item "placement-dataset.csv" -Destination "backend\app\"

# For Linux/Mac
cp placement-dataset.csv backend/app/
``` 