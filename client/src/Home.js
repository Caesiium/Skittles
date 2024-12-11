
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import './Home.css';

function Home(){
    

    return(
            <div>
           <form className='newOrder'>
            <label>
                What would you like to do?
            </label>
            <Link to="/NewOrder">
          <button type="button">Make a new order</button>
            </Link>
            <Link to="/AllOrders">
          <button type="button">View existing orders</button>
            </Link>

           </form>
        </div>
    );
}

export default Home;
