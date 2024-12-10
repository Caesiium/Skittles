import './App.css';
import React from "react";
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Link
} from "react-router-dom";
import NewOrder from './NewOrder';
import AllOrders from './AllOrders';
import EditOrder from './EditOrder';

function App() {
  return(
    <Router>
      <ul className='navBar'>
        <li><Link to="/NewOrder">+</Link></li>
        <li><Link to="/AllOrders"> View Orders</Link></li>
      </ul>
        <Routes>
          <Route path="/NewOrder" element={<NewOrder />} />
          <Route path="/AllOrders" element={<AllOrders />} />
          <Route path="/EditOrder" element={<EditOrder />} />
        </Routes>
    </Router>
  );
}

export default App;