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
import Home from './Home';

function App() {
  return(
    <Router>
      <ul className='navBar'>
        <li><Link to="/">Home</Link></li>
        <li><Link to="/NewOrder"> New Order</Link></li>
        <li><Link to="/AllOrders"> View Orders</Link></li>
      </ul>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/NewOrder" element={<NewOrder />} />
          <Route path="/AllOrders" element={<AllOrders />} />
          <Route path="/EditOrder" element={<EditOrder />} />
        </Routes>
    </Router>
  );
}

export default App;