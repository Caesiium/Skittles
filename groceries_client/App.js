import './App.css';
import React from "react";
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Link
} from "react-router-dom";
import NewOrder from './NewOrder';
import ViewOrders from './ViewOrders';

function App() {
  return(
    <Router>
        <nav>
          <Link to="/NewOrder">
            <button>New order</button>
          </Link>
          <Link to="/ViewOrders">
            <button>View orders</button>
          </Link>
        </nav>
        <Routes>
          <Route path="/NewOrder" element={<NewOrder />} />
          <Route path="/ViewOrders" element={<ViewOrders />} />
        </Routes>
    </Router>
  );
}

export default App;
