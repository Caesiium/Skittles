import './App.css';
import React, {useState} from "react";
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Link,
} from "react-router-dom";
import NewOrder from './NewOrder';
import AllOrders from './AllOrders';
import EditOrder from './EditOrder';
import ShopItem from './ShopItems.js';
import Home from './Home.js';


function App() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [emailError, setEmailError] = useState('');
  const [passError, setPassError] = useState('');
  const [isLoggedIn, setIsLoggedIn] = useState(false);



  

  const onButtonCLick = () => {
    setEmailError('')
    setPassError('')

      //email and password validation
    if('' === email){
      setEmailError('Please enter your email')
      return
    }

    if (!/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(email)) {
      setEmailError('Please enter a valid email')
      return
    }
      
    if ('' === password) {
      setPassError('Please enter a password')
      return
    }

        //add extra validation to check if email and password are stored for users
        //also check that password matches email
      setIsLoggedIn(true);
    } 

  return(
    <Router>
      {isLoggedIn ? (
        <>
          <ul className='navBar'>
            <li><Link to="/Home">Home</Link></li>
            <li><Link to="/NewOrder">New Order</Link></li>
            <li><Link to="/AllOrders"> View Orders</Link></li>
          </ul>
          <Routes>
            <Route path="/Home" element={<Home />} />
            <Route path="/NewOrder" element={<NewOrder />} />
            <Route path="/AllOrders" element={<AllOrders />} />
            <Route path="/EditOrder" element={<EditOrder />} />
            <Route path='/ShopItems' element={<ShopItem />} />
          </Routes>
        </>
        
      ) : (
        <div className='main'>
              <div className='title'>
                  <div>Login</div>
              </div>
              <br/>
              <div className={'inputContainer'}>
              <input
                value={email}
                placeholder="Enter your email here"
                onChange={(ev) => setEmail(ev.target.value)}
                className={'inputBox'}
              />
              <label className="errorLabel">{emailError}</label>
            </div>
              <br/>
              <div className={'inputContainer'}>
                  <input
                      value={password}
                      placeholder='Enter your password'
                      onChange={(ev) => setPassword(ev.target.value)}
                      className={'inputBox'}
                  />
                  <label className='errorLabel'>{passError}</label>
              </div>
              <br/>
              <div className={'inputContainer'}>
                  <input className={'inputButton'}
                      type = "button"
                      onClick={onButtonCLick}
                      value={'Log in'}
                  />
              </div>
            </div>
          )}
    </Router>   
  );
}

export default App;