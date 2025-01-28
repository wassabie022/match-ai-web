import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import HomePage from './components/HomePage/HomePage';
import ContractPage from './components/ContractPage/ContractPage';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/contract" element={<ContractPage />} />
      </Routes>
    </Router>
  );
}

export default App;