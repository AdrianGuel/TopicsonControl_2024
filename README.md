# Topics on Control 2024

This repository offers a variety of **control engineering** topics explored through MATLAB and Simulink simulations, Python notebooks, and optimization algorithms.  
It includes studies on nonlinear systems, system identification, PID controller design, and neural network-based control.

---

## 📁 Repository Structure and Contents

| Folder | Script | Description |
|:------|:------|:-------------|
| **`session2/`** | `animateEuler.m` | Visualization of Euler method simulation. |
|  | `lorentzRK4.m` | Simulates the Lorenz system using Runge-Kutta 4th order method. |
| **`session3/`** | `animateEuler.m` | Another Euler method visualization (different context or system). |
| **`session5/`** | `FinalAlgorithm.m` | Final project script for offline and online system identification. |
|  | `LeastSquaresOffline.m` | Offline Least Squares system identification example. |
|  | `recursiveleastsquares.m` | Recursive Least Squares online estimation example. |
|  | `experimentident.slx` | Simulink model for system identification experiments. |
|  | `step_responses.slx`, `step_responses_sin.slx` | Simulink models for system step response tests. |
|  | `previous_simulink_2016b/` | Older Simulink models compatible with MATLAB 2016b. |
| **`session6/`** | `NNcontrol.ipynb` | Jupyter notebook implementing neural network-based control. |
| **`session_4/`** | `GD_example.m` | Gradient descent optimization example. |
|  | `PIDMetadesign.ipynb` | Notebook on meta-design of PID controllers using optimization. |
|  | `bioreactior_MATLAB.m`, `bioreactor_Octave.m` | Control modeling of a bioreactor system (MATLAB and Octave versions). |
|  | `cart_sys.m`, `cart_sys_ga.m` | Cart system dynamics modeling and genetic algorithm optimization. |
|  | `cart_sys_optimal_fimincon.m` | Cart system optimized using `fmincon` solver. |
|  | `cart_sys_rPID_GD.m` | Robust PID design using gradient descent. |
|  | `cost.m` | Cost function for optimization tasks. |
|  | `example61_MATLAB.m`, `example61_Octave.m` | Additional examples in MATLAB and Octave formats. |

---

## 📚 Topics Covered

- Simulation of nonlinear dynamical systems (e.g., Lorenz attractor)
- System identification via **Least Squares** and **Recursive Least Squares**
- **Gradient Descent** and **Genetic Algorithm** optimization
- PID controller design using optimization techniques
- **Neural Network-based Control** approaches
- Simulink-based experimentation for control systems

---

## 🛠 Requirements

- **MATLAB** R2020b or newer
- **Simulink** (for `.slx` models)
- **Python** (for Jupyter notebooks, preferably with `numpy`, `matplotlib`, and `tensorflow` or `pytorch`)
- GNU Octave compatibility for selected scripts

---

## 🚀 How to Use

1. **Clone the repository**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/TopicsonControl_2024.git
   ```
2. **Add to MATLAB path**:
   ```matlab
   addpath(genpath('path_to_cloned_folder'))
   ```
3. **Run MATLAB examples** or **open Jupyter notebooks** for Python-based control experiments.

---

## ✨ Highlights

- Cross-platform examples (MATLAB, Octave, Python)
- Blend of classical control and modern optimization
- Practical system identification and control design techniques

---

## 📜 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details (if available).

---

## 👨‍💻 Author

Developed by Adrian Guel.
