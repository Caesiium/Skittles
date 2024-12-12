import './App.css';
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link, useLocation } from 'react-router-dom';
function EditOrder({ selectedItems, selectedSupermarket, orderId, currentUser }){
    
    const location = useLocation();
    console.log('location', location.state);
    //const { selectedGroceries  = [] } = location.state || {}
    //const selectedItems = location.state?.selectedItems || [];
    console.log('maybe items?', selectedItems);
    const [groceryDetails, setGroceryDetails] = useState([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);
    

    useEffect(() => {
        if(selectedItems.length > 0){
            const getGroceryInfo = async() => {
                setLoading(true);
                try{
                    const response = await axios.post('http://localhost:8080/api/EditOrder', {
                        selectedItems: selectedItems}, 
                        {headers: {'Content-Type': 'application/json'}
                    });
                    setGroceryDetails(response.data);
                    
                } catch (err){
                    setError('Failed to fetch grocery data, try again');
                    console.error(err.message);
                } finally{
                    setLoading(false);
                }
            };
            getGroceryInfo();
        }
        
    }, [selectedItems]);

    console.log('error', error);
    console.log('loading', loading);

    if(error){
        return <div>Error: {error.message}</div>;
    }

    console.log('yup', currentUser);

    const saveOrder = async () => {
        
    }

    return(
            <div>
           <p>
                Order Number: {orderId}
           </p>
           <button><Link to='/ShopItems'>Add Item</Link></button>
           <table className='Orders'>
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Unit cost</th>
                        <th>No. Units</th>
                        <th>Total Cost</th>
                        <th>Added by</th>
                    </tr>
                </thead>
                <tbody>
                    {groceryDetails.map((row, index) => {
                        const item = selectedItems.find(
                            (selected) => selected.grocery_id === row.grocery_id
                        );
                        return (
                            <tr key={index}>
                                <td>{row.grocery_name}</td>
                                <td>{row.grocery_price}</td>
                                <td>{item?.quantity || 0}</td>
                                <td>{row.grocery_price * (item?.quantity || 0)}</td>
                                <td>{currentUser}</td>
                            </tr>
                        );
                    })}
                </tbody>
           </table>

           <br/>
           <table className='Orders'>
                <tr>
                    <th>User</th>
                    <th>Total Cost</th>
                </tr>
           </table>
           <p>
                Total cost:
           </p>
           <label>
                Apply discount
                <select className='discount'>
                    <option value="NoOp">Please choose an available discount</option>
                </select>
            </label>
            <p>
                <button className='finish'>
                    Complete order
                </button>
            </p>
            <div className={'button'}>
                  <input className={'inputButton'}
                      type = "button"
                      onClick={saveOrder}
                      value={'Save order'}
                  />
              </div>
            
        </div>
        
        
    );
}

export default EditOrder;